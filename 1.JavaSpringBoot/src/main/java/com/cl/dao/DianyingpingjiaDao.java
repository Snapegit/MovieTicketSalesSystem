package com.cl.dao;

import com.cl.entity.DianyingpingjiaEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.DianyingpingjiaView;


/**
 * 电影评价
 * 
 * @author 
 * @email 
 * @date 2024-01-22 22:03:10
 */
public interface DianyingpingjiaDao extends BaseMapper<DianyingpingjiaEntity> {
	
	List<DianyingpingjiaView> selectListView(@Param("ew") Wrapper<DianyingpingjiaEntity> wrapper);

	List<DianyingpingjiaView> selectListView(Pagination page,@Param("ew") Wrapper<DianyingpingjiaEntity> wrapper);
	
	DianyingpingjiaView selectView(@Param("ew") Wrapper<DianyingpingjiaEntity> wrapper);
	

}
