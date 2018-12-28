function selectXQ1(){
	var sheng = $("#sheng").val();
	var shi = $("#shi").val();
	var qu = $("#qu").val();
	var jd = $("#jd").val();
	var name = $("#wg").val();
	var lx = $("#lx").val();
	$('#wg_xiaoqu').datagrid({    
		url:"selectMapPoint",   
		striped:true,//显示斑马线
		pagination:true,//显示分页栏
		rownumbers:true,//如果为true，则显示一个行号列。
		singleSelect:true,//如果为true，则只允许选择一行。
		toolbar: '#czWg',//增加按钮
		queryParams: {
			sheng: sheng,
			shi: shi,
			qu:qu,
			jd:jd,
			name:name,
			lx:lx
		},
		columns:[[    
			{field:'ID',title:'ID',checkbox:true,align:'center'},    
			{field:'NAME',title:'网格名称',align:'center'}
			/*{field:'cz',title:'操作',align:'center',
				formatter:function(value,row,index){
					return "<a style='color:blue' onclick='editorWgOrWd();'>修改</a>/"+
					"<a style='color:red' onclick='alert("+index+");'>删除</a>";
				}
			} */
			]]    
	}); 


	
	
	
	var p = $('#wg_xiaoqu').datagrid('getPager'); 
	$(p).pagination({  
		pageSize: 10,//每页显示的记录条数，默认为10  
		pageList: [5,10,15],//可以设置每页记录条数的列表  
		beforePageText: '当前页数',//页数文本框前显示的汉字  
		afterPageText: '共 {pages} 页',  
		displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',  
		/*onBeforeRefresh:function(){ 
			$(this).pagination('loading'); 
			alert('before refresh'); 
			$(this).pagination('loaded'); 
		}*/ 
	});
}
