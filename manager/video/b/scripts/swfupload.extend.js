if (typeof(SWFUpload) === "function") {
	SWFUpload.extend("CheckFiles");
	SWFUpload.extendCallback("fileChecked","file_check_handler");
	SWFUpload.extend("SetFileStatus");
	SWFUpload.extend("SetPostParam");
	SWFUpload.extend("RemovePostParam");
}