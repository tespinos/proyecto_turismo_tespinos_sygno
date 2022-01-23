package Persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Logica.PaqueteTuristico;
import Logica.ServicioTuristico;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Anabella
 */
public class ServicioTuristicoJpaController implements Serializable {

    public ServicioTuristicoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;
    
    public ServicioTuristicoJpaController() {
        emf = Persistence.createEntityManagerFactory("Blanco_Anabella_tpo3_PU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ServicioTuristico servicioTuristico) {
        if (servicioTuristico.getLista_paquetes_turisticos() == null) {
            servicioTuristico.setLista_paquetes_turisticos(new ArrayList<PaqueteTuristico>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<PaqueteTuristico> attachedLista_paquetes_turisticos = new ArrayList<PaqueteTuristico>();
            for (PaqueteTuristico lista_paquetes_turisticosPaqueteTuristicoToAttach : servicioTuristico.getLista_paquetes_turisticos()) {
                lista_paquetes_turisticosPaqueteTuristicoToAttach = em.getReference(lista_paquetes_turisticosPaqueteTuristicoToAttach.getClass(), lista_paquetes_turisticosPaqueteTuristicoToAttach.getCodigo_paquete());
                attachedLista_paquetes_turisticos.add(lista_paquetes_turisticosPaqueteTuristicoToAttach);
            }
            servicioTuristico.setLista_paquetes_turisticos(attachedLista_paquetes_turisticos);
            em.persist(servicioTuristico);
            for (PaqueteTuristico lista_paquetes_turisticosPaqueteTuristico : servicioTuristico.getLista_paquetes_turisticos()) {
                lista_paquetes_turisticosPaqueteTuristico.getLista_servicios_incluidos().add(servicioTuristico);
                lista_paquetes_turisticosPaqueteTuristico = em.merge(lista_paquetes_turisticosPaqueteTuristico);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ServicioTuristico servicioTuristico) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            ServicioTuristico persistentServicioTuristico = em.find(ServicioTuristico.class, servicioTuristico.getCodigo_servicio());
            List<PaqueteTuristico> lista_paquetes_turisticosOld = persistentServicioTuristico.getLista_paquetes_turisticos();
            List<PaqueteTuristico> lista_paquetes_turisticosNew = servicioTuristico.getLista_paquetes_turisticos();
            List<PaqueteTuristico> attachedLista_paquetes_turisticosNew = new ArrayList<PaqueteTuristico>();
            for (PaqueteTuristico lista_paquetes_turisticosNewPaqueteTuristicoToAttach : lista_paquetes_turisticosNew) {
                lista_paquetes_turisticosNewPaqueteTuristicoToAttach = em.getReference(lista_paquetes_turisticosNewPaqueteTuristicoToAttach.getClass(), lista_paquetes_turisticosNewPaqueteTuristicoToAttach.getCodigo_paquete());
                attachedLista_paquetes_turisticosNew.add(lista_paquetes_turisticosNewPaqueteTuristicoToAttach);
            }
            lista_paquetes_turisticosNew = attachedLista_paquetes_turisticosNew;
            servicioTuristico.setLista_paquetes_turisticos(lista_paquetes_turisticosNew);
            servicioTuristico = em.merge(servicioTuristico);
            for (PaqueteTuristico lista_paquetes_turisticosOldPaqueteTuristico : lista_paquetes_turisticosOld) {
                if (!lista_paquetes_turisticosNew.contains(lista_paquetes_turisticosOldPaqueteTuristico)) {
                    lista_paquetes_turisticosOldPaqueteTuristico.getLista_servicios_incluidos().remove(servicioTuristico);
                    lista_paquetes_turisticosOldPaqueteTuristico = em.merge(lista_paquetes_turisticosOldPaqueteTuristico);
                }
            }
            for (PaqueteTuristico lista_paquetes_turisticosNewPaqueteTuristico : lista_paquetes_turisticosNew) {
                if (!lista_paquetes_turisticosOld.contains(lista_paquetes_turisticosNewPaqueteTuristico)) {
                    lista_paquetes_turisticosNewPaqueteTuristico.getLista_servicios_incluidos().add(servicioTuristico);
                    lista_paquetes_turisticosNewPaqueteTuristico = em.merge(lista_paquetes_turisticosNewPaqueteTuristico);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = servicioTuristico.getCodigo_servicio();
                if (findServicioTuristico(id) == null) {
                    throw new NonexistentEntityException("The servicioTuristico with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            ServicioTuristico servicioTuristico;
            try {
                servicioTuristico = em.getReference(ServicioTuristico.class, id);
                servicioTuristico.getCodigo_servicio();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The servicioTuristico with id " + id + " no longer exists.", enfe);
            }
            List<PaqueteTuristico> lista_paquetes_turisticos = servicioTuristico.getLista_paquetes_turisticos();
            for (PaqueteTuristico lista_paquetes_turisticosPaqueteTuristico : lista_paquetes_turisticos) {
                lista_paquetes_turisticosPaqueteTuristico.getLista_servicios_incluidos().remove(servicioTuristico);
                lista_paquetes_turisticosPaqueteTuristico = em.merge(lista_paquetes_turisticosPaqueteTuristico);
            }
            em.remove(servicioTuristico);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ServicioTuristico> findServicioTuristicoEntities() {
        return findServicioTuristicoEntities(true, -1, -1);
    }

    public List<ServicioTuristico> findServicioTuristicoEntities(int maxResults, int firstResult) {
        return findServicioTuristicoEntities(false, maxResults, firstResult);
    }

    private List<ServicioTuristico> findServicioTuristicoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ServicioTuristico.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public ServicioTuristico findServicioTuristico(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ServicioTuristico.class, id);
        } finally {
            em.close();
        }
    }

    public int getServicioTuristicoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ServicioTuristico> rt = cq.from(ServicioTuristico.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
