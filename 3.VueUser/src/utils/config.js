const config = {
    get() {
        return {
            url : process.env.VUE_APP_BASE_API_URL + process.env.VUE_APP_BASE_API + '/',
            name: process.env.VUE_APP_BASE_API,
			menuList:[
				{
					name: '电影院信息管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'电影院信息',
							url:'/index/dianyingyuanxinxiList'
						},
					]
				},
				{
					name: '待映列表管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'待映列表',
							url:'/index/daiyingliebiaoList'
						},
					]
				},
				{
					name: '电影资讯管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'电影资讯',
							url:'/index/newsList'
						},
					]
				},
				{
					name: '电影信息管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'电影信息',
							url:'/index/dianyingxinxiList'
						},
					]
				},
			]
        }
    },
    getProjectName(){
        return {
            projectName: "基于Spring Boot的电影售票系统"
        } 
    }
}
export default config
