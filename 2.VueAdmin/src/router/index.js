	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import daiyingliebiao from '@/views/daiyingliebiao/list'
	import news from '@/views/news/list'
	import dianyingyuanxinxi from '@/views/dianyingyuanxinxi/list'
	import dianyingpingjia from '@/views/dianyingpingjia/list'
	import fangyingting from '@/views/fangyingting/list'
	import discussdianyingxinxi from '@/views/discussdianyingxinxi/list'
	import dianyingxinxi from '@/views/dianyingxinxi/list'
	import yonghu from '@/views/yonghu/list'
	import orders from '@/views/orders/list'
	import storeup from '@/views/storeup/list'
	import dianyingfenlei from '@/views/dianyingfenlei/list'
	import config from '@/views/config/list'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页Home',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/daiyingliebiao',
			name: '待映列表',
			component: daiyingliebiao
		}
		,{
			path: '/news',
			name: '电影资讯',
			component: news
		}
		,{
			path: '/dianyingyuanxinxi',
			name: '电影院信息',
			component: dianyingyuanxinxi
		}
		,{
			path: '/dianyingpingjia',
			name: '电影评价',
			component: dianyingpingjia
		}
		,{
			path: '/fangyingting',
			name: '放映厅',
			component: fangyingting
		}
		,{
			path: '/discussdianyingxinxi',
			name: '电影信息评论',
			component: discussdianyingxinxi
		}
		,{
			path: '/dianyingxinxi',
			name: '电影信息',
			component: dianyingxinxi
		}
		,{
			path: '/yonghu',
			name: '用户',
			component: yonghu
		}
		,{
			path: '/orders',
			name: '订单管理',
			component: orders
		}
		,{
			path: '/storeup',
			name: '我的收藏',
			component: storeup
		}
		,{
			path: '/dianyingfenlei',
			name: '电影分类',
			component: dianyingfenlei
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		]
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
