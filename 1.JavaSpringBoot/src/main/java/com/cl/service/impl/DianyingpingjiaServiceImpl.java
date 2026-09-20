package com.cl.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cl.utils.PageUtils;
import com.cl.utils.Query;


import com.cl.dao.DianyingpingjiaDao;
import com.cl.entity.DianyingpingjiaEntity;
import com.cl.service.DianyingpingjiaService;
import com.cl.entity.view.DianyingpingjiaView;

@Service("dianyingpingjiaService")
public class DianyingpingjiaServiceImpl extends ServiceImpl<DianyingpingjiaDao, DianyingpingjiaEntity> implements DianyingpingjiaService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DianyingpingjiaEntity> page = this.selectPage(
                new Query<DianyingpingjiaEntity>(params).getPage(),
                new EntityWrapper<DianyingpingjiaEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DianyingpingjiaEntity> wrapper) {
		  Page<DianyingpingjiaView> page =new Query<DianyingpingjiaView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
	@Override
	public List<DianyingpingjiaView> selectListView(Wrapper<DianyingpingjiaEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DianyingpingjiaView selectView(Wrapper<DianyingpingjiaEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
