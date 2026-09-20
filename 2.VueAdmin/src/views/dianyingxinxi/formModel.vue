<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="24">
						<el-form-item label="电影院名称" prop="dianyingyuanmingcheng">
							<el-input class="list_inp" v-model="form.dianyingyuanmingcheng" placeholder="电影院名称"
								 type="text" 								:readonly="!isAdd||disabledForm.dianyingyuanmingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="电影名称" prop="dianyingmingcheng">
							<el-input class="list_inp" v-model="form.dianyingmingcheng" placeholder="电影名称"
								 type="text" 								:readonly="!isAdd||disabledForm.dianyingmingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="海报" prop="haibao">
							<uploads
								:disabled="!isAdd||disabledForm.haibao?true:false"
								action="file/upload" 
								tip="请上传海报" 
								:limit="3" 
								style="width: 100%;text-align: left;"
								:fileUrls="form.haibao?form.haibao:''" 
								@change="haibaoUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="电影分类" prop="dianyingfenlei">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.dianyingfenlei?true:false"
								v-model="form.dianyingfenlei" 
								placeholder="请选择电影分类"
								>
								<el-option v-for="(item,index) in dianyingfenleiLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="导演" prop="daoyan">
							<el-input class="list_inp" v-model="form.daoyan" placeholder="导演"
								 type="text" 								:readonly="!isAdd||disabledForm.daoyan?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="主演" prop="zhuyan">
							<el-input class="list_inp" v-model="form.zhuyan" placeholder="主演"
								 type="text" 								:readonly="!isAdd||disabledForm.zhuyan?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="上映日期" prop="shangyingriqi">
							<el-date-picker
								class="list_date"
								v-model="form.shangyingriqi"
								format="YYYY 年 MM 月 DD 日"
								value-format="YYYY-MM-DD"
								type="datetime"
								:readonly="!isAdd||disabledForm.shangyingriqi?true:false"
								placeholder="请选择上映日期" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="片长" prop="pianzhang">
							<el-input class="list_inp" v-model="form.pianzhang" placeholder="片长"
								 type="text" 								:readonly="!isAdd||disabledForm.pianzhang?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="电影预告" prop="dianyingyugao">
							<uploads
								:disabled="!isAdd||disabledForm.dianyingyugao?true:false"
								type="file"
								action="file/upload" 
								tip="请上传电影预告" 
								:limit="1" 
								style="width: 100%;text-align: left;"
								:fileUrls="form.dianyingyugao?form.dianyingyugao:''" 
								@change="dianyingyugaoUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="时间段" prop="shijianduan">
							<el-input class="list_inp" v-model="form.shijianduan" placeholder="时间段"
								 type="text" 								:readonly="!isAdd||disabledForm.shijianduan?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="场次" prop="changci">
							<el-date-picker
								class="list_date"
								v-model="form.changci"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.changci?true:false"
								placeholder="请选择场次" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="放映厅" prop="fangyingting">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.fangyingting?true:false"
								v-model="form.fangyingting" 
								placeholder="请选择放映厅"
								>
								<el-option v-for="(item,index) in fangyingtingLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="价格" prop="price">
							<el-input class="list_inp" v-model.number="form.price" placeholder="价格"
								 type="number" 								:readonly="!isAdd||disabledForm.price?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="座位总数" prop="number">
							<el-input class="list_inp" v-model.number="form.number" placeholder="座位总数"
								 type="text" 								:readonly="!isAdd||disabledForm.number?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="积分" prop="jf">
							<el-input class="list_inp" v-model.number="form.jf" placeholder="积分"
								 type="text" 								:readonly="!isAdd||disabledForm.jf?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="会员价" prop="vipprice">
							<el-input class="list_inp" v-model.number="form.vipprice" placeholder="会员价"
								 type="number" 								:readonly="!isAdd||disabledForm.vipprice?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="已选座位[用,号隔开]" prop="selected">
							<el-input v-model="form.selected" placeholder="已选座位[用,号隔开]" type="textarea"
							:readonly="!isAdd||disabledForm.selected?true:false"
							/>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="电影简介" prop="dianyingjianjie">
							<editor :value="form.dianyingjianjie" placeholder="请输入电影简介" :readonly="!isAdd||disabledForm.dianyingjianjie?true:false"
								class="list_editor" @change="(e)=>editorChange(e,'dianyingjianjie')"></editor>
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="formModel_cancel" @click="closeClick">取消</el-button>
					<el-button class="formModel_confirm" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'dianyingxinxi'
	const formName = '电影信息'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		dianyingyuanmingcheng : false,
		dianyingmingcheng : false,
		haibao : false,
		dianyingfenlei : false,
		daoyan : false,
		zhuyan : false,
		shangyingriqi : false,
		pianzhang : false,
		dianyingyugao : false,
		dianyingjianjie : false,
		shijianduan : false,
		changci : false,
		fangyingting : false,
		storeupnum : false,
		clicktime : false,
		price : false,
		number : false,
		selected : false,
		clicknum : false,
		thumbsupnum : false,
		crazilynum : false,
		jf : false,
		vipprice : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		dianyingyuanmingcheng: [
		],
		dianyingmingcheng: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		haibao: [
		],
		dianyingfenlei: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		daoyan: [
		],
		zhuyan: [
		],
		shangyingriqi: [
		],
		pianzhang: [
		],
		dianyingyugao: [
		],
		dianyingjianjie: [
		],
		shijianduan: [
		],
		changci: [
		],
		fangyingting: [
		],
		storeupnum: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		clicktime: [
		],
		price: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		number: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		selected: [
		],
		clicknum: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		thumbsupnum: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		crazilynum: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		jf: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		vipprice: [
			{ validator: validateNumber, trigger: 'blur' },
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//海报上传回调
	const haibaoUploadSuccess=(e)=>{
		form.value.haibao = e
	}
	//电影分类列表
	const dianyingfenleiLists = ref([])
	//电影预告上传回调
	const dianyingyugaoUploadSuccess=(e)=>{
		form.value.dianyingyugao = e
	}
	//放映厅列表
	const fangyingtingLists = ref([])
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			dianyingyuanmingcheng: '',
			dianyingmingcheng: '',
			haibao: '',
			dianyingfenlei: '',
			daoyan: '',
			zhuyan: '',
			shangyingriqi: '',
			pianzhang: '',
			dianyingyugao: '',
			dianyingjianjie: '',
			shijianduan: '',
			changci: '',
			fangyingting: '',
			storeupnum: '0',
			clicktime: '',
			price: '0',
			number: '',
			selected: '',
			clicknum: '0',
			thumbsupnum: '0',
			crazilynum: '0',
			jf: '-1',
			vipprice: '-1',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			res.data.data.dianyingjianjie = res.data.data.dianyingjianjie?(res.data.data.dianyingjianjie.replace(reg,'../../../cl4591503/file')):'';
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='dianyingyuanmingcheng'){
					form.value.dianyingyuanmingcheng = row[x];
					disabledForm.value.dianyingyuanmingcheng = true;
					continue;
				}
				if(x=='dianyingmingcheng'){
					form.value.dianyingmingcheng = row[x];
					disabledForm.value.dianyingmingcheng = true;
					continue;
				}
				if(x=='haibao'){
					form.value.haibao = row[x];
					disabledForm.value.haibao = true;
					continue;
				}
				if(x=='dianyingfenlei'){
					form.value.dianyingfenlei = row[x];
					disabledForm.value.dianyingfenlei = true;
					continue;
				}
				if(x=='daoyan'){
					form.value.daoyan = row[x];
					disabledForm.value.daoyan = true;
					continue;
				}
				if(x=='zhuyan'){
					form.value.zhuyan = row[x];
					disabledForm.value.zhuyan = true;
					continue;
				}
				if(x=='shangyingriqi'){
					form.value.shangyingriqi = row[x];
					disabledForm.value.shangyingriqi = true;
					continue;
				}
				if(x=='pianzhang'){
					form.value.pianzhang = row[x];
					disabledForm.value.pianzhang = true;
					continue;
				}
				if(x=='dianyingyugao'){
					form.value.dianyingyugao = row[x];
					disabledForm.value.dianyingyugao = true;
					continue;
				}
				if(x=='dianyingjianjie'){
					form.value.dianyingjianjie = row[x];
					disabledForm.value.dianyingjianjie = true;
					continue;
				}
				if(x=='shijianduan'){
					form.value.shijianduan = row[x];
					disabledForm.value.shijianduan = true;
					continue;
				}
				if(x=='changci'){
					form.value.changci = row[x];
					disabledForm.value.changci = true;
					continue;
				}
				if(x=='fangyingting'){
					form.value.fangyingting = row[x];
					disabledForm.value.fangyingting = true;
					continue;
				}
				if(x=='storeupnum'){
					form.value.storeupnum = row[x];
					disabledForm.value.storeupnum = true;
					continue;
				}
				if(x=='clicktime'){
					form.value.clicktime = row[x];
					disabledForm.value.clicktime = true;
					continue;
				}
				if(x=='price'){
					form.value.price = row[x];
					disabledForm.value.price = true;
					continue;
				}
				if(x=='number'){
					form.value.number = row[x];
					disabledForm.value.number = true;
					continue;
				}
				if(x=='selected'){
					form.value.selected = row[x];
					disabledForm.value.selected = true;
					continue;
				}
				if(x=='clicknum'){
					form.value.clicknum = row[x];
					disabledForm.value.clicknum = true;
					continue;
				}
				if(x=='thumbsupnum'){
					form.value.thumbsupnum = row[x];
					disabledForm.value.thumbsupnum = true;
					continue;
				}
				if(x=='crazilynum'){
					form.value.crazilynum = row[x];
					disabledForm.value.crazilynum = true;
					continue;
				}
				if(x=='jf'){
					form.value.jf = row[x];
					disabledForm.value.jf = true;
					continue;
				}
				if(x=='vipprice'){
					form.value.vipprice = row[x];
					disabledForm.value.vipprice = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			form.value.storeupnum='0'
			form.value.price='0'
			form.value.clicknum='0'
			form.value.thumbsupnum='0'
			form.value.crazilynum='0'
			form.value.jf='-1'
			form.value.vipprice='-1'
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
		})
		context?.$http({
			url: `option/dianyingfenlei/dianyingfenlei`,
			method: 'get'
		}).then(res=>{
			dianyingfenleiLists.value = res.data.data
		})
		context?.$http({
			url: `option/fangyingting/fangyingting`,
			method: 'get'
		}).then(res=>{
			fangyingtingLists.value = res.data.data
		})
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		if(form.value.haibao!=null) {
			form.value.haibao = form.value.haibao.replace(new RegExp(context?.$config.url,"g"),"");
		}
		if(form.value.dianyingyugao!=null) {
			form.value.dianyingyugao = form.value.dianyingyugao.replace(new RegExp(context?.$config.url,"g"),"");
		}
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									formVisible.value = false
									emit('formModelChange')
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							formVisible.value = false
							emit('formModelChange')
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		border: 1px solid rgba(254, 182, 203, 0.5);
		border-radius: 0px;
		padding: 40px 30px;
		margin: 0;
		background: #fff;
		// form item
		:deep(.el-form-item) {
			margin: 0 150px 20px 0;
			background: none;
			display: flex;
			//label
			.el-form-item__label {
			 color: #666;
			 background: none;
			 font-weight: 500;
			 display: block;
			 width: 150px;
			 text-align: right;
			 min-width: 150px;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 120px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					border: 0px solid rgba(255, 255, 255, 0.25);
					border-radius: 0px;
					padding: 0 10px;
					color: #666;
					background: rgba(0, 0, 0, 0.1);
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					height: 36px;
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
				//日期选择器
				.list_date {
					border: 1px solid rgba(255, 255, 255, 0.25);
					border-radius: 0px;
					color: #666;
					background: rgba(0, 0, 0, 0.1);
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
					}
				}
				// 下拉框
				.list_sel {
					border: 1px solid rgba(255, 255, 255, 0.25);
					border-radius: 0px;
					padding: 0 10px;
					color: #666;
					background: rgba(0, 0, 0, 0.1);
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
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
				// 富文本
				.list_editor {
					border-radius: 0;
					padding: 0;
					margin: 0;
					color: #666;
					background: rgba(0, 0, 0, 0.1);
					width: 100%;
					border-color: #ccc;
					border-width: 0;
					border-style: solid;
					height: auto;
				}
				// 长文本
				.el-textarea__inner {
					border: 1px solid rgba(255, 255, 255, 0.25);
					border-radius: 0;
					padding: 12px;
					color: #666;
					background: rgba(0, 0, 0, 0.1);
					width: auto;
					font-size: 14px;
					min-height: 120px;
					min-width: 350px;
				}
				//图片上传样式
				.el-upload-list  {
					//提示语
					.el-upload__tip {
						margin: 7px 0 0;
						color: #999;
						display: flex;
						font-size: 14px;
						justify-content: flex-start;
						align-items: center;
					}
					//外部盒子
					.el-upload--picture-card {
						border: 1px solid rgba(255, 255, 255, 0.25);
						cursor: pointer;
						border-radius: 0px;
						background: rgba(0, 0, 0, 0.1);
						width: 120px;
						line-height: 70px;
						text-align: center;
						height: 60px;
						//图标
						.el-icon{
							color: #999;
							font-size: 26px;
						}
					}
					.el-upload-list__item {
						border: 1px solid rgba(255, 255, 255, 0.25);
						cursor: pointer;
						border-radius: 0px;
						background: rgba(0, 0, 0, 0.1);
						width: 120px;
						line-height: 70px;
						text-align: center;
						height: 60px;
					}
				}
				//文件上传样式
				.upload-demo {
					width: 100%;
					//外部盒子
					.el-upload-dragger {
						border: 1px solid rgba(255, 255, 255, 0.25);
						cursor: pointer;
						border-radius: 0px;
						overflow: hidden;
						background: rgba(0, 0, 0, 0.1);
						width: 360px;
						box-sizing: border-box;
						text-align: center;
						height: auto;
					}
					//图标
					.el-icon--upload {
						margin: 0;
						color: rgba(92, 184, 92, 1);
						font-size: 48px;
						line-height: 48px;
					}
					//提示文字
					.el-upload__text {
						margin: 0px 0 0;
						color: #999;
						font-size: 14px;
						em {
							color: rgba(92, 184, 92, 1);
						}
					}
					//提示文字
					.el-upload__tip {
						margin: 0px 0 0;
						color: #999;
						font-size: 14px;
					}
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: center;
		.formModel_cancel {
			border: 1px solid #d43f3a;
			cursor: pointer;
			border-radius: 3px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #fff;
			background: rgba(217, 83, 79, 0.45);
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_cancel:hover {
		}
		
		.formModel_confirm {
			border: 1px solid #357ebd;
			cursor: pointer;
			border-radius: 3px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #fff;
			background: rgba(66, 139, 202, 0.55);
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_confirm:hover {
		}
	}
</style>