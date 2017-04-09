package com.casic.datadriver.dao.data;

import com.casic.datadriver.model.PageInfo;
import com.casic.datadriver.model.QueryParameters;
import com.casic.datadriver.model.data.OrderDataRelation;
import com.hotent.core.db.BaseDao;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * The Class OrderDataRelationDao.
 */
@Repository
public class OrderDataRelationDao extends BaseDao<OrderDataRelation> {

    /**
     * Query OrderDataRelation basic info list.
     *
     *            the query filter
     * @return the list
     */
    public List<OrderDataRelation> getCanBeOrderDataList(long projectId) {
        return this.getBySqlKey("getCanBeOrderDataList", projectId);
    }
    public List<OrderDataRelation> getOrderDataRelationbyDataId(Long DataId) {
        return this.getBySqlKey("getOrderDataRelationbyDataId", DataId);
    }
    public List<OrderDataRelation> delDDOrderDataRelation(QueryParameters queryparameters) {
        return this.getBySqlKey("delDDOrderDataRelation", queryparameters);
    }

    public List<OrderDataRelation> getDDOrderDataRelation(QueryParameters queryparameters) {
        return this.getBySqlKey("getDDOrderDataRelation", queryparameters);
    }
    /**
     * Query OrderDataRelation basic info list.
     *
     *            the query filter
     * @return the list
     */
    public List<OrderDataRelation> getOrderDataRelationList(Long id) {
        return this.getBySqlKey("getOrderDataRelationList", id);
    }

    public List<OrderDataRelation> getOrderDataRelationListF(PageInfo model) {
        return this.getBySqlKey("getOrderDataRelationListF", model);
    }




    /**
     * Query OrderDataRelation basic info list.
     *
     * @param ddtaskId
     *            the query filter
     * @return the list
     */
    public List<OrderDataRelation> getPublishDataRelationList(Long ddtaskId) {
        return this.getBySqlKey("getPublishDataRelationList", ddtaskId);
    }
    public List<OrderDataRelation> getPublishDataRelationListF(PageInfo model) {
        return this.getBySqlKey("getPublishDataRelationListF", model);
    }

    public List<OrderDataRelation> queryPublishDataRelationByddTaskIDF(PageInfo model) {
        return this.getBySqlKey("queryPublishDataRelationByddTaskIDF", model);
    }
    public List<OrderDataRelation> queryOrderDataRelationByddTaskIDF(PageInfo model) {
        return this.getBySqlKey("queryOrderDataRelationByddTaskIDF", model);
    }

    /*
     * (non-Javadoc)
     *
     * @see com.hotent.core.db.GenericDao#getEntityClass()
     */
    @Override
    public Class<?> getEntityClass() {
        return OrderDataRelation.class;
    }

    public void delPublishByddDataTaskId(long ddDataTaskId) {
        this.getBySqlKey("delPublishByddDataTaskId", ddDataTaskId);
    }


    public void delOrderByddDataTaskId(long ddDataTaskId) {
        this.getBySqlKey("delOrderByddDataTaskId", ddDataTaskId);
    }

    public OrderDataRelation getOrderDataRelationById(long id){
        return this.getUnique("getOrderDataRelationById", id);
    }

    public void delOrderByddDataId(long dataId){this.delBySqlKey("delOrderByddDataId", dataId);}

    public void delPublishByddDataId(long dataId){this.getBySqlKey("delPublishByddDataId", dataId);}

}
