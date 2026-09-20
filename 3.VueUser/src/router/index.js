import { createRouter, createWebHashHistory } from 'vue-router'
import index from '../views'
import home from '../views/pages/home.vue'
import login from '../views/pages/login.vue'
import newsList from '@/views/pages/news/list'
import yonghuList from '@/views/pages/yonghu/list'
import yonghuDetail from '@/views/pages/yonghu/formModel'
import yonghuAdd from '@/views/pages/yonghu/formAdd'
import yonghuRegister from '@/views/pages/yonghu/register'
import yonghuCenter from '@/views/pages/yonghu/center'
import dianyingfenleiList from '@/views/pages/dianyingfenlei/list'
import dianyingfenleiDetail from '@/views/pages/dianyingfenlei/formModel'
import dianyingfenleiAdd from '@/views/pages/dianyingfenlei/formAdd'
import fangyingtingList from '@/views/pages/fangyingting/list'
import fangyingtingDetail from '@/views/pages/fangyingting/formModel'
import fangyingtingAdd from '@/views/pages/fangyingting/formAdd'
import dianyingxinxiList from '@/views/pages/dianyingxinxi/list'
import dianyingxinxiDetail from '@/views/pages/dianyingxinxi/formModel'
import dianyingxinxiAdd from '@/views/pages/dianyingxinxi/formAdd'
import storeupList from '@/views/pages/storeup/list'
import dianyingyuanxinxiList from '@/views/pages/dianyingyuanxinxi/list'
import dianyingyuanxinxiDetail from '@/views/pages/dianyingyuanxinxi/formModel'
import dianyingyuanxinxiAdd from '@/views/pages/dianyingyuanxinxi/formAdd'
import dianyingpingjiaList from '@/views/pages/dianyingpingjia/list'
import dianyingpingjiaDetail from '@/views/pages/dianyingpingjia/formModel'
import dianyingpingjiaAdd from '@/views/pages/dianyingpingjia/formAdd'
import daiyingliebiaoList from '@/views/pages/daiyingliebiao/list'
import daiyingliebiaoDetail from '@/views/pages/daiyingliebiao/formModel'
import daiyingliebiaoAdd from '@/views/pages/daiyingliebiao/formAdd'
import menuList from '@/views/pages/menu/list'
import menuDetail from '@/views/pages/menu/formModel'
import menuAdd from '@/views/pages/menu/formAdd'
import discussdianyingxinxiList from '@/views/pages/discussdianyingxinxi/list'
import discussdianyingxinxiDetail from '@/views/pages/discussdianyingxinxi/formModel'
import discussdianyingxinxiAdd from '@/views/pages/discussdianyingxinxi/formAdd'
import order_confirm from '@/views/pages/shop_order/confirm'
import ordersList from '@/views/pages/shop_order/list'

const routes = [{
		path: '/',
		redirect: '/index/home'
	},
	{
		path: '/index',
		component: index,
		children: [{
			path: 'home',
			component: home
		}
		, {
			path: 'newsList',
			component: newsList
		}
		, {
			path: 'yonghuList',
			component: yonghuList
		}, {
			path: 'yonghuDetail',
			component: yonghuDetail
		}, {
			path: 'yonghuAdd',
			component: yonghuAdd
		}
		, {
			path: 'yonghuCenter',
			component: yonghuCenter
		}
		, {
			path: 'dianyingfenleiList',
			component: dianyingfenleiList
		}, {
			path: 'dianyingfenleiDetail',
			component: dianyingfenleiDetail
		}, {
			path: 'dianyingfenleiAdd',
			component: dianyingfenleiAdd
		}
		, {
			path: 'fangyingtingList',
			component: fangyingtingList
		}, {
			path: 'fangyingtingDetail',
			component: fangyingtingDetail
		}, {
			path: 'fangyingtingAdd',
			component: fangyingtingAdd
		}
		, {
			path: 'dianyingxinxiList',
			component: dianyingxinxiList
		}, {
			path: 'dianyingxinxiDetail',
			component: dianyingxinxiDetail
		}, {
			path: 'dianyingxinxiAdd',
			component: dianyingxinxiAdd
		}
		, {
			path: 'storeupList',
			component: storeupList
		}
		, {
			path: 'dianyingyuanxinxiList',
			component: dianyingyuanxinxiList
		}, {
			path: 'dianyingyuanxinxiDetail',
			component: dianyingyuanxinxiDetail
		}, {
			path: 'dianyingyuanxinxiAdd',
			component: dianyingyuanxinxiAdd
		}
		, {
			path: 'dianyingpingjiaList',
			component: dianyingpingjiaList
		}, {
			path: 'dianyingpingjiaDetail',
			component: dianyingpingjiaDetail
		}, {
			path: 'dianyingpingjiaAdd',
			component: dianyingpingjiaAdd
		}
		, {
			path: 'daiyingliebiaoList',
			component: daiyingliebiaoList
		}, {
			path: 'daiyingliebiaoDetail',
			component: daiyingliebiaoDetail
		}, {
			path: 'daiyingliebiaoAdd',
			component: daiyingliebiaoAdd
		}
		, {
			path: 'menuList',
			component: menuList
		}, {
			path: 'menuDetail',
			component: menuDetail
		}, {
			path: 'menuAdd',
			component: menuAdd
		}
		, {
			path: 'discussdianyingxinxiList',
			component: discussdianyingxinxiList
		}, {
			path: 'discussdianyingxinxiDetail',
			component: discussdianyingxinxiDetail
		}, {
			path: 'discussdianyingxinxiAdd',
			component: discussdianyingxinxiAdd
		}
		, {
			path: 'order_confirm',
			component: order_confirm
		}
		, {
			path: 'ordersList',
			component: ordersList
		}
		]
	},
	{
		path: '/login',
		component: login
	}
	,{
		path: '/yonghuRegister',
		component: yonghuRegister
	}
]

const router = createRouter({
  history: createWebHashHistory(process.env.BASE_URL),
  routes
})

export default router
