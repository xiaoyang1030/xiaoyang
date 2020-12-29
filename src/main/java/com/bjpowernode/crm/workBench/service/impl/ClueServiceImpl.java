package com.bjpowernode.crm.workBench.service.impl;

import com.bjpowernode.crm.base.constants.CrmExceptionEnum;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.base.util.DateTimeUtil;
import com.bjpowernode.crm.base.util.UUIDUtil;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.mapper.UserDao;
import com.bjpowernode.crm.workBench.bean.*;
import com.bjpowernode.crm.workBench.mapper.*;
import com.bjpowernode.crm.workBench.service.ClueSerice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ClueServiceImpl implements ClueSerice {

    @Autowired
    private ClueDao clueDao;
    @Autowired
    private ClueRemarkDao clueRemarkDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private ClueActivityRelationDao activityRelationDao;
    @Autowired
    private ActivityDao activityDao;
    @Autowired
    private TranDao tranDao;
    @Autowired
    private TranHistoryDao tranHistoryDao;
    @Autowired
    private TranRemarkDao tranRemarkDao;
    @Autowired
    private ContactsDao contactsDao;
    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private CustomerRemarkDao customerRemarkDao;
    @Autowired
    private ContactsRemarkDao contactsRemarkDao;
    @Autowired
    private ClueActivityRelationDao clueActivityRelationDao;
    @Autowired
    private ContactsActivityRelationDao contactsActivityRelationDao;

    @Override
    public void createClue(Clue clue) {
        clue.setId(UUIDUtil.getUUID());
        clue.setCreatetime(DateTimeUtil.getSysTime());
        int i = clueDao.insertSelective(clue);
        if (i == 0) {
            throw new CrmException(CrmExceptionEnum.CLUE_CREATE);

        }
    }

    @Override
    public Clue selectById(String id, List<User> users) {
        Clue clue = clueDao.selectByPrimaryKey(id);
        for (User user : users) {
            if (clue.getOwner().equals(user.getId())) {
                clue.setOwner(user.getName());
            }
        }
        ClueRemark clueRemark = new ClueRemark();
        clueRemark.setClueid(clue.getId());
        List<ClueRemark> select = clueRemarkDao.select(clueRemark);
        clue.setClueRemarks(select);
        return clue;
    }

    @Override
    public List<Clue> selectList(ClueQueryVo clueQueryVo) {
        List<Clue> clues = clueDao.selectAll(clueQueryVo);
        for (Clue clue : clues) {
            User user = userDao.selectByPrimaryKey(clue.getOwner());
            clue.setOwner(user.getName());
        }
        return clues;
    }

    @Override
    public List<ClueActivityRelation> queryAll(String id) {
        Activity activity = null;
        Clue clue = null;
        List<ClueActivityRelation> clueActivityRelations = activityRelationDao.selectByCLueId(id);
        for (ClueActivityRelation clueActivityRelation : clueActivityRelations) {
            clue = clueDao.selectByPrimaryKey(clueActivityRelation.getClueid());
            clueActivityRelation.setClue(clue);

            activity = activityDao.selectByPrimaryKey(clueActivityRelation.getActivityid());
            List<User> users = userDao.selectAll();
            for (User user : users) {
                if (activity.getOwner().equals(user.getId())) {
                    activity.setOwner(user.getName());
                }
            }
            clueActivityRelation.setActivity(activity);
        }

        return clueActivityRelations;
    }

    @Override
    public void unbind(String id) {
        int i = activityRelationDao.deleteByPrimaryKey(id);
        if (i == 0) {
            throw new CrmException(CrmExceptionEnum.CLUE_UNBIND);
        }
    }

    @Override
    public List<Activity> bind(String ids, String clueid) {
        ClueActivityRelation clueActivityRelation = new ClueActivityRelation();
        String[] split = ids.split(",");
        for (String s : split) {
            clueActivityRelation.setId(UUIDUtil.getUUID());
            clueActivityRelation.setClueid(clueid);
            clueActivityRelation.setActivityid(s);
            int i = activityRelationDao.insert(clueActivityRelation);
            if (i == 0) {
                throw new CrmException(CrmExceptionEnum.CLUE_BIND);
            }
        }

        List<Activity> list = new ArrayList<>();
        List<ClueActivityRelation> clueActivityRelations = activityRelationDao.selectByCLueId(clueid);
        for (ClueActivityRelation activityRelation : clueActivityRelations) {
            Activity activity = activityDao.selectByPrimaryKey(activityRelation.getActivityid());
            List<User> users = userDao.selectAll();
            for (User user : users) {
                if (activity.getOwner().equals(user.getId())) {
                    activity.setOwner(user.getName());
                    list.add(activity);
                }
            }
        }
        return list;
    }

    @Override
    public void transfer(String isTran, String clueid, Tran tran, String username) {
        Clue clue = clueDao.selectByPrimaryKey(clueid);
        //创建新客户 假定联系人就一个
        /*判断客户是否存在
         * 1 存在通过不同联系人找到同一个客户
         * 2 不存在 第一次找到客户
         * //根据线索中的客户名称查找客户是否存在 公司名称不可能重复*/
        Customer customer = new Customer();
        CustomerRemark customerRemark = new CustomerRemark();
        customer.setName(clue.getCompany());
        Customer customers = customerDao.selectByCustomerName(customer.getName());
        if (customers != null) {
            //客户存在
            customerRemark.setCreateby(username);

        } else {
            //客户不存在
            customer.setId(UUIDUtil.getUUID());
            customer.setAddress(clue.getAddress());
            customer.setContactsummary(clue.getContactsummary());
            customer.setCreateby(username);
            customer.setCreatetime(DateTimeUtil.getSysTime());
            customer.setDescription(clue.getDescription());
            customer.setNextcontacttime(clue.getNextcontacttime());
            customer.setOwner(clue.getOwner());
            customer.setPhone(clue.getPhone());
            customer.setWebsite(clue.getWebsite());
            try{
                customerDao.insertSelective(customer);
            }catch (Exception e){
                e.printStackTrace();
            }
            customerRemark.setId(UUIDUtil.getUUID());
            customerRemark.setCustomerid(customer.getId());
            customerRemark.setCreateby(username);
            customerRemark.setCreatetime(DateTimeUtil.getSysTime());
            customerRemark.setEditflag("0");
            try{
                customerRemarkDao.insertSelective(customerRemark);
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        //创建联系人
        Contacts contacts = new Contacts();
        contacts.setId(UUIDUtil.getUUID());
        contacts.setOwner(customer.getOwner());
        contacts.setCustomerid(customer.getId());
        contacts.setAddress(clue.getAddress());
        contacts.setAppellation(clue.getAppellation());
        contacts.setContactsummary(clue.getContactsummary());
        contacts.setCreateby(username);
        contacts.setCreatetime(DateTimeUtil.getSysTime());
        contacts.setEmail(clue.getEmail());
        contacts.setFullname(clue.getFullname());
        contacts.setDescription(clue.getDescription());
        contacts.setJob(clue.getJob());
        contacts.setMphone(clue.getMphone());
        contacts.setNextcontacttime(clue.getNextcontacttime());
        contacts.setSource(clue.getSource());
        try{
            contactsDao.insertSelective(contacts);
        }catch (Exception e){
            e.printStackTrace();
        }


        //将线索中的联系人备注信息保存在联系人备注表中
        ContactsRemark contactsRemark = new ContactsRemark();
        contactsRemark.setId(UUIDUtil.getUUID());
        contactsRemark.setCreateby(username);
        contactsRemark.setCreatetime(DateTimeUtil.getSysTime());
        contactsRemark.setEditflag("0");
        try{
            contactsRemarkDao.insertSelective(contactsRemark);
        }catch (Exception e){
            e.printStackTrace();
        }


        //把线索和市场活动的关系转换到联系人和市场活动的关系(联系人--市场活动 n-n关系)
        //得先根据线索的id号查询对应的所有的市场活动
        ClueActivityRelation clueActivityRelation = new ClueActivityRelation();
        clueActivityRelation.setClueid(clueid);

        List<ClueActivityRelation> clueActivityRelations = activityRelationDao.selectByCLueId(clueid);
        ContactsActivityRelation contactsActivityRelation = new ContactsActivityRelation();
        //联系人和市场活动的关系
        for (ClueActivityRelation activityRelation : clueActivityRelations) {
            contactsActivityRelation.setId(UUIDUtil.getUUID());
            contactsActivityRelation.setActivityid(tran.getActivityid());
            contactsActivityRelation.setContactsid(contacts.getId());
            contactsActivityRelationDao.insert(contactsActivityRelation);
        }


        //创建交易
        if ("1".equals(isTran)) {
            tran.setId(UUIDUtil.getUUID());
            tran.setCreateby(username);
            tran.setCreatetime(DateTimeUtil.getSysTime());
            int i = tranDao.insertSelective(tran);
            if (i == 0) {
                throw new CrmException(CrmExceptionEnum.CLUE_TRANSFER);
            }
            //交易历史
            TranHistory tranHistory = new TranHistory();
            tranHistory.setId(UUIDUtil.getUUID());
            tranHistory.setTranid(tran.getId());
            tranHistory.setMoney(tran.getMoney());
            tranHistory.setStage(tran.getStage());
            tranHistory.setExpecteddate(tran.getExpecteddate());
            tranHistory.setCreateby(username);
            tranHistory.setCreatetime(DateTimeUtil.getSysTime());
            try{
                tranHistoryDao.insertSelective(tranHistory);
            }catch (Exception e){
                e.printStackTrace();
            }

            //交易备注
            TranRemark tranRemark = new TranRemark();
            tranRemark.setId(UUIDUtil.getUUID());
            tranRemark.setCreateby(username);
            tranRemark.setCreatetime(DateTimeUtil.getSysTime());
            tranRemark.setTranid(tran.getId());
            try{
                tranRemarkDao.insertSelective(tranRemark);
            }catch (Exception e){
                e.printStackTrace();
            }


        }
        //删除线索和市场活动的关联关系表
        for (ClueActivityRelation activityRelation : clueActivityRelations) {
            ClueActivityRelation clueActivityRelation1 = new ClueActivityRelation();
            clueActivityRelation1.setClueid(clueid);
            clueActivityRelation1.setActivityid(tran.getActivityid());
            try{
                clueActivityRelationDao.deleteByClueidAndActivityId(clueActivityRelation1);
            }catch (Exception e){
                e.printStackTrace();
            }

        }
        //删除线索
       // clueDao.deleteByPrimaryKey(clueid);
    }
}
