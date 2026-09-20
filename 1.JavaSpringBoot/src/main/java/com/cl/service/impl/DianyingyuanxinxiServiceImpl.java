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


import com.cl.dao.DianyingyuanxinxiDao;
import com.cl.entity.DianyingyuanxinxiEntity;
import com.cl.service.DianyingyuanxinxiService;
import com.cl.entity.view.DianyingyuanxinxiView;

@Service("dianyingyuanxinxiService")
public class DianyingyuanxinxiServiceImpl extends ServiceImpl<DianyingyuanxinxiDao, DianyingyuanxinxiEntity> implements DianyingyuanxinxiService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DianyingyuanxinxiEntity> page = this.selectPage(
                new Query<DianyingyuanxinxiEntity>(params).getPage(),
                new EntityWrapper<DianyingyuanxinxiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DianyingyuanxinxiEntity> wrapper) {
		  Page<DianyingyuanxinxiView> page =new Query<DianyingyuanxinxiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
	@Override
	public List<DianyingyuanxinxiView> selectListView(Wrapper<DianyingyuanxinxiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DianyingyuanxinxiView selectView(Wrapper<DianyingyuanxinxiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
