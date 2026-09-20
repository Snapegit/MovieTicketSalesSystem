<template>
	<div class="app-contain" :style='{"padding":"0 12%","margin":"10px auto 20px","alignItems":"flex-start","borderRadius":"0px","flexWrap":"wrap","background":"none","display":"flex","width":"100%","position":"relative","justifyContent":"space-between"}'>
		<div class="bread_view">
			<el-breadcrumb separator=">" class="breadcrumb">
				<el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">首页</el-breadcrumb-item>
				<el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
			</el-breadcrumb>
		</div>
		<div class="back_view">
			<el-button class="back_btn" @click="backClick" type="primary">返回</el-button>
		</div>
		<div class="detail_view">
			<div class="swiper_view">
				<mySwiper :data="bannerList" :type="3"
				:loop="false"
				:navigation="false"
				:pagination="true"
				:paginationType="1"
				:scrollbar="false"
				:slidesPerView="1"
				:spaceBetween="20"
				:autoHeight="false"
				:centeredSlides="false"
				:freeMode="false"
				:effectType="5"
				:direction="horizontal"
				:autoplay="true"
				:slidesPerColumn="1">
				<template #default="scope">
					<img :style='{"border":"0px solid #fff","width":"100%","objectFit":"cover","height":"400px"}' :src="scope.row?$config.url + scope.row:''">
				</template>
			</mySwiper>
			</div>
			<div class="thumbs_view">
				<div class="zan" v-if="!crazilyType&&!thumbsupType" @click="thumbsupOrCrazilyClick(21)">
					<i class="iconfont icon-thumb-up-line2"></i>
					<span>赞({{detail.thumbsupnum}})</span>
				</div>
				<div class="zan" v-if="!crazilyType&&!thumbsupType" @click="thumbsupOrCrazilyClick(22)">
					<i class="iconfont icon-thumb-down-line2"></i>
					<span>踩({{detail.crazilynum}})</span>
				</div>
				<div class="zan" v-if="thumbsupType" @click="cancelThumbsupOrCrazilyClick(21)">
					<i class="iconfont iconfontActive icon-thumb-up-fill3"></i>
					<span class="textActive">取消赞({{detail.thumbsupnum}})</span>
				</div>
				<div class="zan" v-if="crazilyType" @click="cancelThumbsupOrCrazilyClick(22)">
					<i class="iconfont iconfontActive icon-thumb-down-fill2"></i>
					<span class="textActive">取消踩({{detail.crazilynum}})</span>
				</div>
			</div>
			
			<div class="info_view">
				<div class="title_view">
					<div class="detail_title">
						{{detail.dianyingmingcheng}}
					</div>
					<div class="follow" v-if="!collectType" @click="collectClick(1)">
						<i class="iconfont icon-likeline2"></i>
						<span>收藏</span>
					</div>
					<div class="follow" v-if="collectType" @click="collectClick(-1)">
						<i class="iconfont iconfontActive icon-likefill2"></i>
						<span class="textActive">取消收藏</span>
					</div>
				</div>
				<div class="info_item">
					<div class="info_label">价格</div>
					<div class="info_price"><span>￥</span>{{detail.price}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">会员价</div>
					<div class="info_price"><span>￥</span>{{detail.vipprice}}</div>
				</div>
				<div class="info_item" v-if="detail.jf">
					<div class="info_label">积分</div>
					<div class="info_price">{{detail.jf}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">电影院名称</div>
					<div  class="info_text" >{{detail.dianyingyuanmingcheng}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">电影分类</div>
					<div  class="info_text" >{{detail.dianyingfenlei}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">导演</div>
					<div  class="info_text" >{{detail.daoyan}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">主演</div>
					<div  class="info_text" >{{detail.zhuyan}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">上映日期</div>
					<div  class="info_text" >{{detail.shangyingriqi}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">片长</div>
					<div  class="info_text" >{{detail.pianzhang}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">时间段</div>
					<div  class="info_text" >{{detail.shijianduan}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">场次</div>
					<div  class="info_text" >{{detail.changci}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">放映厅</div>
					<div  class="info_text" >{{detail.fangyingting}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">收藏数量</div>
					<div  class="info_text" >{{detail.storeupnum}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">座位总数</div>
					<div  class="info_text" >{{detail.number}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">点击次数</div>
					<div  class="info_text" >{{detail.clicknum}}</div>
				</div>
				<div class="btn_view">
					<el-button class="jf_btn"  type="primary" @click="jfredeem">积分兑换</el-button>
					<el-button class="book_btn" type="warning" size="small" @click="bookClick">立即预订</el-button>
				</div>
				<div class="btn_view">
					<el-button class="cross_btn" v-if="btnFrontAuth(tableName,'评价')" @click="dianyingpingjiaonAcross('评价','dianyingpingjia','','','')" type="warning">评价</el-button>
					<el-button class="edit_btn" v-if="centerType&&btnAuth('dianyingxinxi','修改')" type="primary" @click="editClick">修改</el-button>
					<el-button class="del_btn" v-if="centerType&&btnAuth('dianyingxinxi','删除')" type="danger" @click="delClick">删除</el-button>
				</div>
			</div>
		</div>
		<!-- 热门 -->
		<div class="detail_hot_view">
			<div class="detail_hot_title">推荐信息</div>
			<div class="detail_hot_list">
				<div class="detail_hot" v-for="(item,index) in hotList" :key="index" @click="toDetailClick(item.id)">
					<div class="detail_hot_img_view"><el-image class="detail_hot_img" fit="cover"
							:src="$config.url + (item.haibao?item.haibao.split(',')[0]:'')"></el-image>
					</div>
					<div class="detail_hot_content">
						<div class="detail_hot_text">{{item.dianyingmingcheng}}</div>
						<div class="detail_hot_text">{{item.changci}}</div>
						<div class="detail_hot_text">{{item.fangyingting}}</div>
					</div>
				</div>
			</div>
		</div>
		<div class="video_view">
			<video :src="$config.url + detail.dianyingyugao" controls autoplay></video>
		</div>
		<el-tabs type="border-card" v-model="activeName" class="tabs_view">
			<el-tab-pane label="电影简介" name="first">
				<div v-html="detail.dianyingjianjie"></div>
			</el-tab-pane>
			<el-tab-pane label="评论" name="commentActive">
				<div class="my_comment_view">
					<el-form ref="commentFormRef" :model="commentForm" class="my_comment_form"
						:rules="commentRules">
						<el-form-item prop="content">
							<el-input class="comment_inp" v-model="commentForm.content" type="textarea"
								placeholder="请输入评论内容"></el-input>
						</el-form-item>
					</el-form>
					<div class="comment_btn">
						<el-button class="add_btn" type="primary" @click="commentSave">立即评论</el-button>
						<el-button class="reset_btn" @click="resetForm">重置</el-button>
					</div>
				</div>
				<div class="comment_list">
					<div class="comment" v-for="(item,index) in commentList" :key="index">
						<div class="comment_top">
							<div class="comment_user">
								<div class="comment_user_img">
									<img :src="item.avatarurl?$config.url + item.avatarurl:'../../../assets/avatar.png'" alt="">
								</div>
								<div class="comment_user_info">
									{{item.nickname}}
								</div>
							</div>
							<div class="comment_time">{{item.addtime}}</div>
						</div>
						<div class="comment_bottom">
							<div class="comment_content">{{item.content}}</div>
							<div class="comment_reply" v-if="item.reply">
								回复：{{item.reply}}
							</div>
						</div>
					</div>
				</div>
				<el-pagination
					background 
					:layout="layouts.join(',')"
					:total="commentTotal" 
					:page-size="commentQuery.limit"
					prev-text="上一页"
					next-text="下一页"
					:hide-on-single-page="false"
					:style='{"border":"0px solid #eee","padding":"0","margin":"20px 0 0","whiteSpace":"nowrap","color":"#333","textAlign":"center","flexWrap":"wrap","background":"none","display":"flex","width":"100%","fontWeight":"500","justifyContent":"center"}'
					@size-change="commentSizeChange"
					@current-change="commentCurrentChange" 
					@prev-click="commentPrevClick"
					@next-click="commentNextClick"  />
			</el-tab-pane>
			<el-tab-pane label="选座" name="auctionActive">
				<div class="seatList">
					<div class="seat" v-for="(item,index) in seatList" :key="index">
						<img @click="seatSelect(0)" v-if="item.select" src="../../../assets/seat/1/yixuanzuowei.png" alt="">
						<img @click="seatSelect(1,item)" v-else-if="!item.active" src="../../../assets/seat/1/zuowei.png" alt="">
						<img @click="seatSelect(1,item)" v-else src="../../../assets/seat/1/yixuanzuowei.png" alt="">
						<div class="seatText">{{item.name}}号</div>
					</div>
				</div>
			</el-tab-pane>
		</el-tabs>
	</div>
</template>
<script setup>
	import axios from 'axios'
	import {
		ref,
		getCurrentInstance,
		watch,
		onUnmounted,
		onMounted,
		nextTick,
		computed
	} from 'vue';
	import {
		ElMessageBox
	} from 'element-plus'
	import {
		useRoute,
		useRouter
	} from 'vue-router';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const route = useRoute()
	const router = useRouter()
	//基础信息
	const tableName = 'dianyingxinxi'
	const formName = '电影信息'
	//基础信息
	const breadList = ref([{
		name: formName
	}])
	//权限验证
	const btnAuth = (e,a)=>{
		if(centerType.value){
			return context?.$toolUtil.isBackAuth(e,a)
		}else{
			return context?.$toolUtil.isAuth(e,a)
		}
	}
	//查看权限验证
	const btnFrontAuth = (e,a)=>{
		if(centerType.value){
			return context?.$toolUtil.isBackAuth(e,a)
		}else{
			return context?.$toolUtil.isFrontAuth(e,a)
		}
	}
	// 返回
	const backClick = () =>{
		history.back()
	}
	// 轮播图
	const bannerList = ref([])
	// 详情
	const title = ref('')
	const detail = ref({})
    const activeName = ref('first')
	const seatList = ref([])
	const getDetail = () => {
		context?.$http({
			url: `${tableName}/detail/${route.query.id}`,
			method: 'get'
		}).then(res => {
			title.value = res.data.data.dianyingmingcheng
			bannerList.value = res.data.data.haibao?res.data.data.haibao.split(','):[]
			// 选座
			let selectArr = res.data.data.selected?res.data.data.selected.split(','):[]
			for(let x = 1;x<=res.data.data.number;x++){
				seatList.value.push({
					name:`${x}`,
					select:false,
					active:false
				})
			}
			for(let i in selectArr){
				seatList.value[selectArr[i] - 1].select = true
			}
			detail.value = res.data.data
		})
	}
	// 下载文件
	const downClick = (file) => {
		if(!file){
			context?.$toolUtil.message('文件不存在','error')
		}
		let arr = file.replace(new RegExp('file/', "g"), "")
		axios.get((location.href.split(context?.$config.name).length>1 ? location.href.split(context?.$config.name)[0] :'') + context?.$config.name + '/file/download?fileName=' + arr, {
			headers: {
				token: context?.$toolUtil.storageGet('frontToken')
			},
			responseType: "blob"
		}).then(({
			data
		}) => {
			const binaryData = [];
			binaryData.push(data);
			const objectUrl = window.URL.createObjectURL(new Blob(binaryData, {
				type: 'application/pdf;chartset=UTF-8'
			}))
			const a = document.createElement('a')
			a.href = objectUrl
			a.download = arr
			// a.click()
			// 下面这个写法兼容火狐
			a.dispatchEvent(new MouseEvent('click', {
				bubbles: true,
				cancelable: true,
				view: window
			}))
			window.URL.revokeObjectURL(data)
		})
	}
	// 判断是否从个人中心跳转
	const centerType = ref(false)
	const init = () => {
		if(route.query.centerType){
			centerType.value = true
		}
		getDetail()
		// 赞踩状态
		getThumbsupOrCrazily()
		// 收藏
		getCollect()
		// 热门
		getHotList()
		// 评论
		getCommentList()
	}
	// 赞or踩
	const thumbsupType = ref(false)
	const crazilyType = ref(false)
	const thumbsupOrCrazilyInfo = ref({})
	// 获取赞踩状态
	const getThumbsupOrCrazily = () => {
		if (context?.$toolUtil.storageGet('frontToken')) {
			context?.$http({
				url: 'storeup/list',
				method: 'get',
				params: {
					page: 1,
					limit: 1,
					type: 21,
					refid: route.query.id,
					tablename: tableName,
					userid: context?.$toolUtil.storageGet('userid')
				}
			}).then(res => {
				if (res.data.data.list.length) {
					thumbsupType.value = true
					thumbsupOrCrazilyInfo.value = res.data.data.list[0]
				}
			})
			context?.$http({
				url: 'storeup/list',
				method: 'get',
				params: {
					page: 1,
					limit: 1,
					type: 22,
					refid: route.query.id,
					tablename: tableName,
					userid: context?.$toolUtil.storageGet('userid')
				}
			}).then(res => {
				if (res.data.data.list.length) {
					crazilyType.value = true
					thumbsupOrCrazilyInfo.value = res.data.data.list[0]
				}
			})
		}
	}
	// 赞踩按钮
	const thumbsupOrCrazilyClick = (type) => {
		let params = {
			name: title.value,
			picture: bannerList.value[0],
			refid: detail.value.id,
			type: type,
			tablename: tableName,
			userid: context?.$toolUtil.storageGet('userid')
		}
		context?.$http({
			url: 'storeup/add',
			method: 'post',
			data: params
		}).then(res => {
			if (type == 21) detail.value.thumbsupnum += 1
			if (type == 22) detail.value.crazilynum += 1
			context?.$http({
				url: `${tableName}/update`,
				method: 'post',
				data: detail.value
			})
			getThumbsupOrCrazily()
			context?.$toolUtil.message('操作成功', 'success')
		})
	}
	//取消赞踩按钮
	const cancelThumbsupOrCrazilyClick = (type) => {
		let ids = []
		ids.push(thumbsupOrCrazilyInfo.value.id)
		context?.$http({
			url: 'storeup/delete',
			method: 'post',
			data: ids
		}).then(res => {
			if (type == 21) detail.value.thumbsupnum -= 1
			if (type == 22) detail.value.crazilynum -= 1
			context?.$http({
				url: `${tableName}/update`,
				method: 'post',
				data: detail.value
			})
			thumbsupType.value = false
			crazilyType.value = false
			thumbsupOrCrazilyInfo.value = {}
			getThumbsupOrCrazily()
			context?.$toolUtil.message('取消成功', 'success')
		})
	}
	// 收藏
	const collectType = ref(false)
	const collectInfo = ref({})
	const getCollect = () => {
		if (context?.$toolUtil.storageGet('frontToken')) {
			context?.$http({
				url: 'storeup/list',
				method: 'get',
				params: {
					page: 1,
					limit: 1,
					type: 1,
					refid: route.query.id,
					tablename: tableName,
					userid: context?.$toolUtil.storageGet('userid')
				}
			}).then(res => {
				if (res.data.data.list.length) {
					collectType.value = true
					collectInfo.value = res.data.data.list[0]
				}
			})
		}
	}
	// 收藏按钮
	const collectClick = (type) => {
		if (type == 1 && !collectType.value) {
			let params = {
				name: title.value,
				picture: bannerList.value[0],
				refid: detail.value.id,
				type: type,
				tablename: tableName,
				userid: context?.$toolUtil.storageGet('userid')
			}
			context?.$http({
				url: 'storeup/add',
				method: 'post',
				data: params
			}).then(res => {
				detail.value.storeupnum += 1
				context?.$http({
					url: `${tableName}/update`,
					method: 'post',
					data: detail.value
				})
				collectType.value = true
				getCollect()
				context?.$toolUtil.message('收藏成功', 'success')
			})
		}
		else if (type == -1 && collectType.value) {
			let ids = []
			ids.push(collectInfo.value.id)
			context?.$http({
				url: 'storeup/delete',
				method: 'post',
				data: ids
			}).then(res => {
				detail.value.storeupnum -= 1
				context?.$http({
					url: `${tableName}/update`,
					method: 'post',
					data: detail.value
				})
				collectInfo.value = {}
				collectType.value = false
				context?.$toolUtil.message('取消成功', 'success')
			})
		}
	}
	//热门推荐
	const hotList = ref([])
	const getHotList = () => {
		let url = `${tableName}/autoSort`
		if(context?.$toolUtil.storageGet('frontToken')) {
			url = `${tableName}/autoSort2`;
		}
		context?.$http({
			url: url,
			method: 'get',
			params: {
				page: 1,
				limit: 4
			}
		}).then(res => {
			hotList.value = res.data.data.list
		})
	}
	const toDetailClick = (id) => {
		router.push(`${tableName}Detail?id=${id}`)
		setTimeout(()=>{
			init()
			document.body.scrollTop = 0
			document.documentElement.scrollTop = 0
		},10)
	}
	//评论
	const commentForm = ref({
		content: '',
		refid: route.query.id,
		userid: context?.$toolUtil.storageGet('userid'),
		nickname: context?.$toolUtil.storageGet('frontName'),
		avatarurl: context?.$toolUtil.storageGet('headportrait') ? context?.$toolUtil.storageGet('headportrait') : ''
	})
	const commentRules = ref({
		content: [{
			required: true,
			message: '请输入',
			trigger: 'blur'
		}, ]
	})
	const commentQuery = ref({
		page: 1,
		limit: 10,
		refid: route.query.id
	})
	const layouts = ref(["prev","pager","next","total","jumper"])
	const commentList = ref([])
	const commentTotal = ref(0)
	const commentFormRef = ref(null)
	const commentSizeChange = (size) =>{
		commentQuery.value.limit = size
		getCommentList()
	}
	const commentCurrentChange = (page) =>{
		commentQuery.value.page = page
		getCommentList()
	}
	const commentPrevClick = () =>{
		commentQuery.value.page = commentQuery.value.page - 1
		getCommentList()
	}
	const commentNextClick = () =>{
		commentQuery.value.page = commentQuery.value.page + 1
		getCommentList()
	}
	const getCommentList = () => {
		context?.$http({
			url: `discuss${tableName}/list`,
			params: commentQuery.value,
			method: 'get'
		}).then(res => {
			commentList.value = res.data.data.list
			commentTotal.value = res.data.data.total
	
		})
	}
	//提交评论
	const commentSave = () => {
		let sensitiveWords = "";
		let sensitiveWordsArr = [];
		if(sensitiveWords) {
		    sensitiveWordsArr = sensitiveWords.split(",");
		}
		for(var i=0; i<sensitiveWordsArr.length; i++){
		    //全局替换
		    var reg = new RegExp(sensitiveWordsArr[i],"g");
		    //判断内容中是否包括敏感词
		    if (commentForm.value.content.indexOf(sensitiveWordsArr[i]) > -1) {
		        // 将敏感词替换为 **
		        commentForm.value.content = commentForm.value.content.replace(reg,"**");
		    }
		}
		commentFormRef.value.validate((valid) => {
			if (valid) {
				context?.$http({url:'orders/list',method:'get',params:{page:1,limit:1,status:'已完成',goodid:detail.value.id,userid:context?.$toolUtil.storageGet('userid')}}).then(res=>{
					if(res.data.data.list.length==0){
						context?.$toolUtil.message('请完成订单后再评论！','error')
						return false
					}
					context?.$http({
						url: `discuss${tableName}/add`,
						method: 'post',
						data: commentForm.value
					}).then(res => {
						context?.$toolUtil.message('评论成功', 'success', () => {
							resetForm()
							getCommentList()
						})
					})
				})
			}
		})
	}
	const resetForm = () => {
		commentFormRef.value.resetFields()
	}
	//创建订单id
	const createOrderId = () =>{
		let orderId = ''
		let now = new Date()
		orderId += now.getFullYear();
		orderId += now.getMonth() + 1;
		orderId += now.getDate();
		orderId += now.getHours();
		orderId += now.getMinutes();
		orderId += now.getSeconds();
		orderId += now.getMilliseconds();
		return orderId
	}
	//立即预订
	const bookClick = () => {
		let activeSeat = []
		for(let i in seatList.value){
			if(seatList.value[i].active){
				activeSeat.push(seatList.value[i].name)
			}
		}
		if(activeSeat.length==0){
			context?.$toolUtil.message('请选择需要预订的位置！','error')
			return false
		}
		let data = {
			orderid: createOrderId(),
			tablename: tableName,
			userid: context?.$toolUtil.storageGet('userid'),
			goodid: detail.value.id,
			goodname: title.value,
			buynumber: activeSeat.length,
			total: 0,
			discounttotal: 0,
			address: activeSeat.join(','),
			status: '已支付',
			discountprice: detail.value.vipprice,
			picture: bannerList.value[0],
			goodtype: detail.value.dianyingfenlei,
		}
		if(detail.value.price){
			data['status'] = '未支付'
			data['price'] = (context?.$toolUtil.storageGet('vip')=='是'&&detail.value.vipprice>0)?detail.value.vipprice:detail.value.price
			data['total'] = parseFloat(data['price'] * activeSeat.length).toFixed(2)
			ElMessageBox.confirm(`是否预订选中座位`, '提示', {
				confirmButtonText: '是',
				cancelButtonText: '否',
				type: 'warning',
			}).then(()=>{
				context?.$toolUtil.storageSet('orders_good',JSON.stringify([data]))
				let query = {
					type:1,
					seat:1
				}
				router.push({path:'/index/order_confirm',query:query})
			})
		}
	}
	const seatSelect = (type,item) =>{
		if(!type){
			context?.$toolUtil.message('座位已被预定','error')
			return false
		}
		item.active = !item.active
	}
	const buyNumber = ref(1)
	//立即购买
	const buyNow = () => {
		let data = {
			tablename: tableName,
			goodid: detail.value.id,
			goodname: title.value,
			buynumber: buyNumber.value,
			userid: context?.$toolUtil.storageGet('userid'),
			discountprice: detail.value.vipprice ? detail.value.vipprice : 0,
			goodtype: detail.value.dianyingfenlei,
			picture: bannerList.value[0],
			price: (context?.$toolUtil.storageGet('vip')=='是' && detail.value.vipprice > 0)? detail.value.vipprice : detail.value.price,
		}
		context?.$toolUtil.storageSet('orders_good',JSON.stringify([data]))
		let query = {
			type: 1
		}
		router.push({path: '/index/order_confirm', query: query})
	}
	const jfTap = () => {
		let data = {
			tablename: tableName,
			goodid: detail.value.id,
			goodname: title.value,
			buynumber: buyNumber.value,
			userid: context?.$toolUtil.storageGet('userid'),
			price: detail.value.jf,
			discountprice: detail.value.jf ?detail.value.jf : 0,
			goodtype: detail.value.dianyingfenlei,
			picture: bannerList.value[0],
		}
		context?.$toolUtil.storageSet('orders_good',JSON.stringify([data]))
		let query = {
			type:2
		}
		router.push({path: '/index/order_confirm', query: query})
	}
	const jfredeem = () => {
		let activeSeat = []
		for(let i in seatList.value){
			if(seatList.value[i].active){
				activeSeat.push(seatList.value[i].name)
			}
		}
		if(activeSeat.length == 0){
			context?.$toolUtil.message('请选择要兑换的位置！','error')
			return false
		}
		if(activeSeat.length > 1){
			context?.$toolUtil.message('用积分只能兑换一个位置!','error')
			return false
		}
		let data = {
			orderid: createOrderId(),
			tablename: tableName,
			userid: context?.$toolUtil.storageGet('userid'),
			goodid: detail.value.id,
			goodname: title.value,
			buynumber: activeSeat.length,
			total: 0,
			discounttotal: 0,
			address: activeSeat.join(','),
			status: '已支付',
			picture: bannerList.value[0],
			goodtype: detail.value.dianyingfenlei,
		}
		if(detail.value.price){
			data['status'] = '未支付'
			data['price'] = detail.value.jf
			data['total'] = parseFloat(data['jf'] * activeSeat.length).toFixed(2)
			ElMessageBox.confirm(`是否预订选中座位`, '提示', {
				confirmButtonText: '是',
				cancelButtonText: '否',
				type: 'warning',
			}).then(()=>{
				context?.$toolUtil.storageSet('orders_good',JSON.stringify([data]))
				let query = {
					type:2,
					seat:1
				}
				router.push({path:'/index/order_confirm',query:query})
			})
		}
	}
	//修改
	const editClick = () => {
		router.push(`/index/${tableName}Add?id=${detail.value.id}&&type=edit`)
	}
	//删除
	const delClick = () => {
		ElMessageBox.confirm(`是否删除此${formName}？`, '提示', {
			confirmButtonText: '是',
			cancelButtonText: '否',
			type: 'warning',
		}).then(()=>{
			context?.$http({
				url: `${tableName}/delete`,
				method: 'post',
				data: [detail.value.id]
			}).then(res=>{
				context?.$toolUtil.message('删除成功','success',()=>{
					history.back()
				})
			})
			
		})
	}
	const dianyingpingjiaonAcross = (btnType,table,crossOptAudit,statusColumnName,tips,statusColumnValue) => {
		if(!context?.$toolUtil.storageGet('frontToken')){
			context?.$toolUtil.message('请登录后再操作！','error')
			return false
		}
		if(!btnAuth(tableName,btnType)){
			context?.$toolUtil.message('暂无权限操作！','error')
			return false
		}
		context?.$toolUtil.storageSet('crossObj',JSON.stringify(detail.value))
		context?.$toolUtil.storageSet('crossTable',tableName)
		context?.$toolUtil.storageSet('crossStatusColumnName',statusColumnName)
		context?.$toolUtil.storageSet('crossTips',tips)
		context?.$toolUtil.storageSet('crossStatusColumnValue',statusColumnValue)
		if(statusColumnName!=''&&!statusColumnName.startsWith("[")) {
			var obj = detail.value
			for (var o in obj){
				if(o==statusColumnName && obj[o]==statusColumnValue){
					context?.$toolUtil.message(tips,'error')
					return;
				}
			}
		}
		nextTick(()=>{
			router.push(`/index/${table}Add?type=cross&&id=${detail.value.id}`)
		})
	}
	onMounted(()=>{
		init()
	})
</script>
<style lang="scss" scoped>
	// 返回盒子
	.back_view {
		border-radius: 0px;
		padding: 0 20px;
		margin: 0 auto 20px;
		background: none;
		display: block;
		width: 100%;
		text-align: right;
		// 返回按钮
		.back_btn {
			border: 1px solid #ddd;
			cursor: pointer;
			border-radius: 0px;
			padding: 0 30px;
			outline: none;
			color: #666;
			background: #f9f9f9;
			width: auto;
			font-size: 14px;
			height: 32px;
		}
		// 返回按钮-悬浮
		.back_btn:hover {
		}
	}
	// 面包屑盒子
	.bread_view {
		border-radius: 0px;
		padding: 12px 0px;
		margin: 0px auto;
		background: none;
		width: 100%;
		border-color: #eee;
		border-width: 0 0 0px;
		position: relative;
		border-style: solid;
		:deep(.breadcrumb) {
			font-size: 14px;
			line-height: 1;
			.el-breadcrumb__separator {
				margin: 0 9px;
				color: #999;
				font-weight: 500;
			}
			.first_breadcrumb {
				.el-breadcrumb__inner {
					color: #333;
					display: inline-block;
				}
			}
			.second_breadcrumb {
				.el-breadcrumb__inner {
					color: #999;
					display: inline-block;
				}
			}
		}
	}
	
	.detail_view{
		border-radius: 0;
		padding: 20px 20px 80px;
		background: linear-gradient(to right,#3A475F,#422240);
		display: flex;
		width: 100%;
		min-height: 520px;
		border-color: #ddd;
		border-width: 0px;
		justify-content: space-between;
		position: relative;
		border-style: solid;
		flex-wrap: wrap;
		// 轮播图
		.swiper_view {
			border: 0px solid #ddd;
			padding: 10px;
			margin: 0;
			background: #fff;
			width: 320px;
			float: left;
			height: 420px;
			order: 0;
		}
		
		// 赞踩盒子
		.thumbs_view {
			margin: 20px 0;
			top: 440px;
			left: 20px;
			display: flex;
			width: 320px;
			justify-content: space-around;
			align-items: center;
			position: absolute;
			order: 4;
			.zan {
				border: 0px solid #eee;
				cursor: pointer;
				border-radius: 2px;
				padding: 4px 20px;
				margin: 0;
				color: #ffffff;
				background: #756189;
				display: flex;
				width: auto;
				align-items: center;
				box-sizing: border-box;
				transition: all 0.3s;
		
				.iconfont {
					padding: 0 10px 0 0;
					color: #fff;
					font-size: 24px;
				}
				.iconfontActive {
					margin: 0 4px 0 0;
					color: #fff;
					font-size: 24px;
				}
				span {
					color: #fff;
				}
				.textActive {
					color: #fff;
				}
			}
			.zan:hover {
			}
			.zan:active {
				transform: scale(1);
			}
		}
		// 文字区
		.info_view {
			border: 0px solid #ddd;
			padding: 0 4%;
			margin: 0 0 0px;
			background: none;
			width: calc(100% - 350px);
			box-sizing: border-box;
			float: right;
			order: 3;
		
			.title_view {
				border: 0px solid #ddd;
				padding: 0px;
				margin: 0 0 10px;
				background: none;
				display: flex;
				width: 100%;
				line-height: 40px;
				justify-content: space-between;
				align-items: center;
		
				.detail_title {
					color: #fff;
					font-weight: 600;
					font-size: 26px;
				}
				// 收藏盒子
				.follow {
					border: 0px solid #ffffff50;
					cursor: pointer;
					border-radius: 4px;
					padding: 4px 10px;
					color: #fff;
					background: none;
					display: flex;
					width: auto;
					line-height: 1;
					justify-content: center;
					align-items: center;
					.iconfont {
						margin: 0 4px 0 0;
						color: #f60;
						font-size: 18px;
					}
					.iconfontActive {
						margin: 0 4px 0 0;
						color: #11396160;
						font-size: 18px;
					}
					span {
						color: #f60;
						font-size: 14px;
					}
					.textActive {
						color: #11396190;
						font-size: 14px;
					}
				}
				.follow:hover {
				}
				.follow:active {
					transform: scale(0.9);
				}
			}
		
			.info_item {
					border-radius: 0px;
					padding: 0 0 6px;
					margin: 0 0 0px;
					background: none;
					display: flex;
					border-color: #ddd;
					border-width: 0 0 0px;
					align-items: center;
					border-style: dashed;
		
				.info_label {
					margin: 0 12px 0 0;
					color: #fff;
					font-weight: 500;
					width: auto;
				}
				.info_text {
					color: #fff;
				}
			}
			.btn_view {
				padding: 0;
				margin: 6px 0 10px;
				display: block;
				width: 100%;
				flex-wrap: wrap;
				// 积分兑换-按钮
				.jf_btn {
					border: 0px solid rgba(85, 85, 127, 1.0);
					padding: 0 10px;
					color: #fff;
					background: rgba(85, 85, 127, 1.0);
					line-height: 32px;
					transition: all 0.3s;
					height: 32px;
				}
				// 悬浮
				.jf_btn:hover {
				}
				// 立即预定-按钮
				.book_btn {
					border: 0px solid rgba(170, 170, 127, 1.0);
					padding: 0 10px;
					color: #fff;
					background: rgb(45, 152, 243);
					line-height: 32px;
					transition: all 0.3s;
					height: 32px;
				}
				// 悬浮
				.book_btn:hover {
				}
				// 跨表-按钮
				.cross_btn {
					border: 0px solid rgba(170, 0, 0, 1.0);
					padding: 0 10px;
					color: #fff;
					background: rgba(170, 0, 0, 1.0);
					line-height: 32px;
					transition: all 0.3s;
					height: 32px;
				}
				// 悬浮
				.cross_btn:hover {
				}
				// 修改-按钮
				.edit_btn {
					border: 0px solid #2da065;
					padding: 0 10px;
					color: #fff;
					background: #2da065;
					line-height: 32px;
					transition: all 0.3s;
					height: 32px;
				}
				// 悬浮
				.edit_btn:hover {
				}
				// 删除-按钮
				.del_btn {
					border: 0px solid #f68b8b;
					padding: 0 10px;
					color: #fff;
					background: #f68b8b;
					line-height: 32px;
					transition: all 0.3s;
					height: 32px;
				}
				// 悬浮
				.del_btn:hover {
				}
			}
		}
	}
	
	//热门推荐
	
	//热门信息
	.detail_hot_view {
		margin: 20px 0 0 0;
		background: none;
		flex: 3;
		width: calc(65% - 20px);
		order: 11;
		// 热门标题
		.detail_hot_title {
			border-radius: 0px;
			padding: 0 0px 0px;
			color: #ef4238!important;
			background: #fff;
			font-weight: 500;
			font-size: 22px;
			border-color: #eee;
			border-width: 0px 0px 2px;
			line-height: 44px;
			border-style: solid;
			text-align: left;
		}
		// 热门列表
		.detail_hot_list {
			padding: 0;
			margin: 20px 0 0;
			background: #fff;
			display: flex;
			width: 100%;
			border-color: #ddd;
			border-width: 0px;
			justify-content: space-between;
			border-style: solid;
			flex-wrap: wrap;
			// 热门item
			.detail_hot {
				border: 0px solid #eee;
				cursor: pointer;
				padding: 0;
				margin: 0 0 20px;
				background: #fff;
				width: calc(15% - 0px);
				box-sizing: border-box;
				// 热门img盒子
				.detail_hot_img_view {
					margin: 0px;
					width: 100%;
					height: 220px;
					// 热门img
					.detail_hot_img {
					border: 0px solid #ddd;
					padding: 0px;
					object-fit: cover;
					width: 100%;
					height: 100%;
					}
				}
				// 热门内容盒子
				.detail_hot_content {
					padding: 0px;
					background: none;
					// 热门名称
					.detail_hot_text {
						padding: 0 10px;
						margin: 0;
						overflow: hidden;
						color: #333;
						white-space: nowrap;
						background: none;
						font-size: 14px;
						line-height: 40px;
						text-overflow: ellipsis;
						text-align: center;
					}
				}
			}
		}
	}
	//视频盒子
	.video_view {
		border: 0px solid #ddd;
		border-radius: 0px;
		padding: 0px;
		margin: 64px 5% 0 0;
		background: #fff;
		flex: 1;
		display: block;
		width: 200px;
		order: 10;
	
		video {
			border: 0px solid #ddd;
			border-radius: 0px;
			padding: 0px;
			margin: 0px auto;
			outline: none;
			background: #f8f8f8;
			display: block;
			width: 100%;
		}
	}

	//底部盒子
	.tabs_view {
		border: 0px solid #ddd;
		border-radius: 0px;
		padding: 20px 0;
		box-shadow: none;
		margin: 0px auto;
		background: #fff;
		width: 100%;
		:deep(.el-tabs__header) {
			background: transparent;
			border: none;
		}
		// 头部
		:deep(.el-tabs__nav-scroll) {
			border-radius: 0;
			padding: 0px 0px 0;
			margin: 0;
			background: url(http://clfile.zggen.cn/20231214/9641f34153974d92b82100003e815b85.png) repeat-x center bottom;
			display: flex;
			border-color: #eee;
			border-width: 0;
			position: relative;
			border-style: solid;
			flex-wrap: wrap;
			height: 48px;
			.el-tabs__nav {
				background: none;
				.el-tabs__item {
					border: 0px solid #eee;
					padding: 0 0px;
					margin: 0 30px 0 0;
					color: #333;
					font-weight: 500;
					display: inline-block;
					font-size: 18px;
					line-height: 48px;
					transition: all 0.3s;
					border-radius: 0px;
					background: none;
					border-width: 0px 0px 2px;
					position: relative;
					list-style: none;
					text-align: center;
					height: 48px;
				}
				.el-tabs__item:hover {
					border: 0px solid #ef4238;
					color: #ef4238;
					background: none;
					border-width: 0px 0px 2px;
				}
				.is-active {
					border: 0px solid #ef4238;
					border-radius: 0px;
					padding: 0 0px;
					margin: 0 30px 0 0;
					color: #ef4238;
					background: none;
					font-size: 18px;
					border-width: 0px 0px 2px;
					line-height: 48px;
					text-align: center;
					height: 48px;
				}
			}
		}
		// 内容区
		:deep(.el-tabs__content) {
			border-radius: 4px;
			padding: 20px 0 0;
			margin: 0px;
			color: #666;
			background: none;
			font-size: 14px;
			border-color: #eee;
			border-width: 0px;
			border-style: solid;
		}
		//评论
		//我的评论
		.my_comment_view {
			border: 0px solid #eee;
			border-radius: 4px;
			box-shadow: none;
			padding: 0px;
			margin: 0px;
			background: none;
			width: 100%;
		
			.my_comment_form {
				border: 0px solid #eee;
				border-radius: 0px;
				padding: 0px;
				box-shadow: none;
				background: #fff;
				width: 100%;
				box-sizing: border-box;
				// 输入框
				:deep(.el-textarea__inner) {
					border: 1px solid #eee;
					border-radius: 0;
					padding: 12px;
					box-shadow: none;
					color: #333;
					width: 100%;
					font-size: 14px;
					min-height: 120px;
				}
			}
			// 按钮盒子
			.comment_btn {
				margin: 20px 0 0;
				display: flex;
				width: 100%;
				justify-content: center;
				align-items: center;
				// 评论按钮
				.add_btn {
					border: none;
					border-radius: 0px;
					padding: 0 30px;
					margin: 0 20px 0 0;
					color: #fff;
					background: #f34d41;
					line-height: 40px;
					transition: all 0.3s;
					height: 40px;
				}
				// 悬浮
				.add_btn:hover {
				}
				// 重置按钮
				.reset_btn {
					border: 0px solid #113961;
					border-radius: 0px;
					padding: 0 30px;
					color: #fff;
					background: rgb(45, 152, 243);
					line-height: 40px;
					transition: all 0.3s;
					min-width: 120px;
					height: 40px;
				}
				// 悬浮
				.reset_btn:hover {
				}
			}
		}
		
		//评论列表
		.comment_list {
			border: 0px solid #eee;
			border-radius: 0px;
			padding: 0px;
			margin: 30px auto;
			background: none;
			display: flex;
			width: 100%;
			justify-content: space-between;
			flex-wrap: wrap;
		
			.comment {
				border: 0px solid #2da06530;
				border-radius: 4px;
				padding: 0 0 10px;
				margin: 0 0 20px;
				background: none;
				width: 48%;
				box-sizing: border-box;
				.comment_top {
					border-radius: 0px;
					padding: 0 0 0px;
					background: #fff;
					display: flex;
					width: 100%;
					font-size: 14px;
					border-color: #ddd;
					border-width: 0 0 1px;
					justify-content: space-between;
					align-items: center;
					border-style: solid;
		
					.comment_user {
						border-radius: 4px;
						padding: 4px 30px 4px 10px;
						display: block;
						align-items: center;
						.comment_user_img {
							margin: 0 10px 0 0;
							font-size: 0;
							float: left;
		
							img {
								border-radius: 50%;
								width: 40px;
								height: 40px;
							}
						}
						.comment_user_info {
							color: #333;
							font-weight: 600;
							font-size: 14px;
							line-height: 40px;
							float: left;
						}
					}
					.comment_time{
						border: 0px solid #eee;
						border-radius: 4px;
						padding: 0px 20px;
						color: #999;
						font-size: 14px;
						float: right;
					}
				}
		
				.comment_bottom {
					border: 0px solid #eee;
					border-radius: 4px;
					padding: 0px 10px;
					margin: 10px 0 0;
					flex-direction: column;
					display: flex;
					width: 100%;
					align-items: flex-start;
					.comment_content {
						color: #666;
						font-weight: 600;
						font-size: 14px;
					}
					.comment_reply {
						padding: 10px 0 0;
						flex-direction: column;
						color: #999;
						text-indent: 2rem;
						display: flex;
						width: 100%;
						font-size: 14px;
						align-items: flex-start;
					}
				}
			}
		}
		// 分页器
		.el-pagination {
			// 总页码
			:deep(.el-pagination__total) {
				margin: 0 10px 0;
				color: #666;
				font-weight: 400;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
			}
			// 上一页
			:deep(.btn-prev) {
				border: 1px solid #ddd;
				border-radius: 2px;
				padding: 0 4px;
				margin: 0 2px;
				color: #666;
				background: #fff;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				min-width: 28px;
				height: 28px;
			}
			// 下一页
			:deep(.btn-next) {
				border: 1px solid #ddd;
				border-radius: 2px;
				padding: 0 4px;
				margin: 0 2px;
				color: #666;
				background: #fff;
				display: inline-block;
				vertical-align: top;
				font-size: 14px;
				line-height: 28px;
				min-width: 28px;
				height: 28px;
			}
			// 上一页禁用
			:deep(.btn-prev:disabled) {
				border: 1px solid #ddd;
				cursor: not-allowed;
				padding: 0 4px;
				margin: 0 2px;
				color: #C0C4CC;
				display: inline-block;
				vertical-align: top;
				font-size: 14px;
				line-height: 28px;
				border-radius: 2px;
				background: none;
				min-width: 28px;
				height: 28px;
			}
			// 下一页禁用
			:deep(.btn-next:disabled) {
				border: 1px solid #ddd;
				cursor: not-allowed;
				padding: 0 4px;
				margin: 0 2px;
				color: #C0C4CC;
				display: inline-block;
				vertical-align: top;
				font-size: 14px;
				line-height: 28px;
				border-radius: 2px;
				background: none;
				min-width: 28px;
				height: 28px;
			}
			// 页码
			:deep(.el-pager) {
				padding: 0;
				margin: 0;
				display: inline-block;
				vertical-align: top;
				// 数字
				.number {
					cursor: pointer;
					padding: 0 4px;
					margin: 0 5px;
					color: #666;
					display: inline-block;
					vertical-align: top;
					font-size: 13px;
					line-height: 28px;
					border-radius: 2px;
					background: #f4f4f5;
					text-align: center;
					min-width: 28px;
					height: 28px;
				}
				// 数字悬浮
				.number:hover {
					cursor: pointer;
					padding: 0 4px;
					margin: 0 5px;
					color: #fff;
					display: inline-block;
					vertical-align: top;
					font-size: 13px;
					line-height: 28px;
					border-radius: 2px;
					background: #ff5200;
					text-align: center;
					min-width: 28px;
					height: 28px;
				}
				// 选中
				.number.is-active {
					cursor: default;
					padding: 0 4px;
					margin: 0 5px;
					color: #fff;
					display: inline-block;
					vertical-align: top;
					font-size: 13px;
					line-height: 28px;
					border-radius: 2px;
					background: #ff5200;
					text-align: center;
					min-width: 28px;
					height: 28px;
				}
			}
			// sizes
			:deep(.el-pagination__sizes) {
				box-shadow: none;
				margin: 0 0 0 5px;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
				.el-select {
					border: 0px solid #DCDFE6;
					cursor: pointer;
					padding: 0;
					color: #606266;
					display: inline-block;
					font-size: 13px;
					line-height: 28px;
					border-radius: 2px;
					outline: 0;
					background: #f4f4f5;
					width: 100%;
					text-align: center;
					height: 28px;
				//去掉默认样式
				.select-trigger{
					height: 100%;
					.el-input{
						height: 100%;
						.el-input__wrapper{
							border: none;
							box-shadow: none;
							background: none;
							border-radius: 0;
							height: 100%;
							padding: 0;
						}
						.is-focus {
							box-shadow: none !important;
						}
					}
				}
				}
			}
			// 跳页
			:deep(.el-pagination__jump) {
				margin: 0 0 0 24px;
				color: #606266;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
				// 输入框
				.el-input {
					border: 1px solid #ddd;
					cursor: pointer;
					padding: 0 3px;
					margin: 0 6px;
					color: #606266;
					display: inline-block;
					font-size: 14px;
					line-height: 28px;
					border-radius: 3px;
					outline: 0;
					background: #fff;
					width: 38px;
					text-align: center;
					height: 28px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
						padding: 0;
					}
					.is-focus {
						box-shadow: none !important;
					}
				}
			}
		}
		//选座
		.seatList{
			border-radius: 0px;
			padding: 20px 0 0 2%;
			background: none;
			display: flex;
			align-items: center;
			flex-wrap: wrap;
			.seat{
				border: 1px solid #eee;
				border-radius: 4px;
				padding: 10px 20px;
				margin: 0 1.6% 20px 0;
				flex-direction: column;
				background: #fff;
				display: flex;
				width: 15%;
				justify-content: center;
				align-items: center;
				img{
					cursor: pointer;
					width: 48px;
				}
				.seatText{
					color: #555;
					font-weight: 500;
					font-size: 16px;
				}
			}
		}
	}
	


</style>