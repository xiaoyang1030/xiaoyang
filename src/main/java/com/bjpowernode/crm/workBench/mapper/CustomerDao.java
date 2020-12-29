package com.bjpowernode.crm.workBench.mapper;

import com.bjpowernode.crm.workBench.bean.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerDao {
    int deleteByPrimaryKey(String id);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByCustomer(Customer record);

    List<Customer> selectByName(@Param("name")String name);

    List<Customer> selectAll();

    List<Customer> selectCustomer(@Param("name")String name);


   Customer selectByCustomerName(@Param("name")String name);

    Customer selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);


}