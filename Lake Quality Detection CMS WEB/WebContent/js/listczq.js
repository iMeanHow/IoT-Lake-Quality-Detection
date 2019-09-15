

function fn_cmn_del(tag,id,tp){
	$(tag).hasClass('czxgray')?layer.msg(tp):___fn_del(tag,id);
}

//通用的文章审核
function fn_cmn_sh(tag,id,shzt){
	var xh = getxhidx();
	var data={shzt:shzt,id:id,xh:$(tag).parents("tr").children(":eq("+xh+")").text(),u:getu()}
	layer.open({
		    type: 1,
		    title:'审核',
		    area:'95%',
		    shadeClose :true,
		    content: template('sid_popsh', data),
		    tjpcms_clsouter:'cls_sid_popsh_out'
		});
}

function fn_op_wzsh(tag,id,xh,u,cursh){
	var op = $(tag).val();
	var tacont = $(tag).parent().prev()
	var tacval = tacont.val()
	if ("审核意见（100字以内）"==tacval) tacval="";
	if (op=='退回修改' && isEmptyStr(tacval)){
		layer.msg('请填写退回修改的原因！');
		tacont.focus();
		return;
	}
	if (!isEmptyStr(tacval) && tacval.length>100){
		layer.msg('审核意见最多100字！');
		tacont.focus();
		return;
	}
	layer.confirm('确定要将序号为 <strong>'+xh+' </strong> 的记录 <strong>'+op+' </strong> 吗？', {icon: 3, title:'提示'}, function(index){
		$.ajax({
			type:"POST",
			url:'aj_cmn_sh.dhtml',
			data:{id:id,u:u,shzt:op,shyj:tacval},
			beforeSend:function(){layer.msg('操作中，请稍后......', {time:-1,icon: 16,shade: 0.3, scrollbar:false});},  
			datatype: "text",
			success:function(ret){
				layer.closeAll();
				if ("0" ==ret){
					sxcur();
				}else if ("-1"==ret){
					layer.alert('操作失败，请联系管理员！', { icon:2, title:'错误'});
				}else{
					layer.alert(ret, { icon:2, title:'错误'});
				}
			},
			error: function(){
				layer.alert('操作失败，请刷新后重试！', { icon:2, title:'错误'});
			}
		});			
	});
}


function fn_usr_tipedit(id){
	layer.confirm('请注意编辑保存后将由管理员重新审核', {icon: 3, title:'提示'}, function(index){
		location.href="aev.dhtml?t=1&u="+getu()+"&id="+id
	})
}