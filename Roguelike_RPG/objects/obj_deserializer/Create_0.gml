if (!is_undefined(filename)) {
	file = file_text_open_read(filename)
	//instance_create...
	file_close(file)
}