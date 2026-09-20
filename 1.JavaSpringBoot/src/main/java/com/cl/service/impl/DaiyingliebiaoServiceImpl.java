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


import com.cl.dao.DaiyingliebiaoDao;
import com.cl.entity.DaiyingliebiaoEntity;
import com.cl.service.DaiyingliebiaoService;
import com.cl.entity.view.DaiyingliebiaoView;

@Service("daiyingliebiaoService")
public class DaiyingliebiaoServiceImpl extends ServiceImpl<DaiyingliebiaoDao, DaiyingliebiaoEntity> implements DaiyingliebiaoService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DaiyingliebiaoEntity> page = this.selectPage(
                new Query<DaiyingliebiaoEntity>(params).getPage(),
                new EntityWrapper<DaiyingliebiaoEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DaiyingliebiaoEntity> wrapper) {
		  Page<DaiyingliebiaoView> page =new Query<DaiyingliebiaoView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
	@Override
	public List<DaiyingliebiaoView> selectListView(Wrapper<DaiyingliebiaoEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DaiyingliebiaoView selectView(Wrapper<DaiyingliebiaoEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
