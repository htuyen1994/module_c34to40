<!-- BEGIN: main -->
<br>
- Function này để chuyển đổi 1 số bảng như nv3_vi_counter, nv3_vi_searchkeys, nv3_vi_referer_stats
<br>
<br>
- Sau đó sẽ xóa hết các dữ liệu của site cũ đi, nên chắc chắn rằng bạn đã chuyển đổi dữ liệu hết các module
<br>
<br>

<form action="{NV_BASE_SITEURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
	<input type="hidden" name="save"  value="1" />
    <p><input type="checkbox" name="deletenv3" id="deletenv3" value="1"/> <label for="deletenv3">Xóa các bảng của NukeViet 3</label></p>
	<input name="import" type="submit" value="Thực hiện nâng cấp" class="btn btn-success">
</form>

<p style="color: #D30000">
	{ERR}
</p>
<!-- END: main -->