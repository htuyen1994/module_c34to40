<!-- BEGIN: main -->

<b>Hướng dẫn thực hiện:</b>
<br>
<br>
- Cài lại module news, để xoá các bài viết và chuyên mục đã có trước đó.
<br>
<br>
- dùng phpmyadmin, hoặc các công cụ khác để import CSDL site NukeViet 3.4 vào cùng một CSDL với site chạy NukeViet 4
(nếu đã import rồi thì bỏ qua bước này)
<br>
<br>
- Copy các ảnh của module news cũ, Sang thư mục của module news đang sử dụng của NukeViet 4
<br>
<br>
- Sử dụng chức năng để chuyển đổi.
<br>
<br>

<form id="form-update" class="form-horizontal" action="{NV_BASE_SITEURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}&amp;" method="post">
	<div class="form-group">
		<label class="col-sm-4 control-label">Bảng dữ liệu NukeViet 3</label>
		<div class="col-sm-20">
			<select name="nv3_news" class="form-control">
				<!-- BEGIN: nv3_news -->
				<option value="{NV3_NEWS.module_data}">{NV3_NEWS.module_data} ({NV3_NEWS.custom_title})</option>
				<!-- END: nv3_news -->
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-4 control-label">Module news trên NukeViet 4</label>
		<div class="col-sm-20">
			<select name="mod_name" class="form-control">
				<!-- BEGIN: mod_data -->
				<option value="{MOD_DATA.value}">{MOD_DATA.custom_title}</option>
				<!-- END: mod_data -->
			</select>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" value="1" class="btn btn-primary" onclick="$(this).html('<i class=\'fa fa-spin fa-spinner\'></i> Đang thực hiện vui lòng đợi').prop('disabled', true);$('#form-update').submit()">Thực hiện nâng cấp</button>
		</div>
	</div>
</form>

<div id="update-result">
    <div id="update-result-top"></div>
</div>

<script type="text/javascript">
function controlRequest(ajurl) {
    $.ajax({
        url: ajurl,
        dataType: 'json'
    }).done(function(e) {
        showMessage(e.message, e.class);
        if (e.url != '') {
            showMessage(e.urlmessage, '');
            setTimeout(function(){
                controlRequest(e.url)
            }, 1000)
        }
        if (e.complete) {
            showMessage('Tiến trình hoàn tất', 'text-success');
            $('#form-update').find('select').prop('disabled', false);
            $('#form-update').find('[type="button"]').prop('disabled', false).html('Thực hiện nâng cấp');
        }
    }).fail(function(e) {
        showMessage('Lỗi AJAX', 'text-danger');
    });
}
function showMessage(m, c) {
    $('<p class="' + c + '" style="margin-bottom:0">&raquo; ' + m + '</p>').insertAfter('#update-result-top');
}
$(function(){
    $('#form-update').submit(function(e){
        e.preventDefault();
        var data = $('#form-update').serialize();
        var action = $('#form-update').attr('action');
        $('#form-update').find('select').prop('disabled', true);
        $('<p>Tiến trình bắt đầu chạy</p>').insertAfter('#update-result-top');
        if (action.indexOf("&amp;") == -1 && action.indexOf("&") == -1) {
            controlRequest(action + '?' + data);
        } else {
            controlRequest(action + data);
        }
        
    });
})
</script>
<!-- END: main -->