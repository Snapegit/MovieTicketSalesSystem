package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.utils.PageUtils;
import com.cl.entity.DaiyingliebiaoEntity;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.DaiyingliebiaoView;


/**
 * 待映列表
 *
 * @author 
 * @email 
 * @date 2024-01-22 22:03:10
 */
public interface DaiyingliebiaoService extends IService<DaiyingliebiaoEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DaiyingliebiaoView> selectListView(Wrapper<DaiyingliebiaoEntity> wrapper);
   	
   	DaiyingliebiaoView selectView(@Param("ew") Wrapper<DaiyingliebiaoEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DaiyingliebiaoEntity> wrapper);
   	

}

