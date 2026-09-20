package com.cl.dao;

import com.cl.entity.DaiyingliebiaoEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.DaiyingliebiaoView;


/**
 * 待映列表
 * 
 * @author 
 * @email 
 * @date 2024-01-22 22:03:10
 */
public interface DaiyingliebiaoDao extends BaseMapper<DaiyingliebiaoEntity> {
	
	List<DaiyingliebiaoView> selectListView(@Param("ew") Wrapper<DaiyingliebiaoEntity> wrapper);

	List<DaiyingliebiaoView> selectListView(Pagination page,@Param("ew") Wrapper<DaiyingliebiaoEntity> wrapper);
	
	DaiyingliebiaoView selectView(@Param("ew") Wrapper<DaiyingliebiaoEntity> wrapper);
	

}
