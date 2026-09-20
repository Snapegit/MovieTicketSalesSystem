package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.utils.PageUtils;
import com.cl.entity.DianyingpingjiaEntity;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.DianyingpingjiaView;


/**
 * 电影评价
 *
 * @author 
 * @email 
 * @date 2024-01-22 22:03:10
 */
public interface DianyingpingjiaService extends IService<DianyingpingjiaEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DianyingpingjiaView> selectListView(Wrapper<DianyingpingjiaEntity> wrapper);
   	
   	DianyingpingjiaView selectView(@Param("ew") Wrapper<DianyingpingjiaEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DianyingpingjiaEntity> wrapper);
   	

}

