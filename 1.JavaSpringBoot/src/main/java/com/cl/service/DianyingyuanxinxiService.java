package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.utils.PageUtils;
import com.cl.entity.DianyingyuanxinxiEntity;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.DianyingyuanxinxiView;


/**
 * 电影院信息
 *
 * @author 
 * @email 
 * @date 2024-01-22 22:03:10
 */
public interface DianyingyuanxinxiService extends IService<DianyingyuanxinxiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DianyingyuanxinxiView> selectListView(Wrapper<DianyingyuanxinxiEntity> wrapper);
   	
   	DianyingyuanxinxiView selectView(@Param("ew") Wrapper<DianyingyuanxinxiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DianyingyuanxinxiEntity> wrapper);
   	

}

