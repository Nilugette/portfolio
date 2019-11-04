var Program = function() {
	this.pen = new Pen();
	this.colorPalette = new ColorPalette();
	this.canvas = new Slate(this.pen);
};
Program.prototype.onClickPenColor = function(event)
{
 	var element = event.currentTarget;
    var color = $(element).data("color");
    this.pen.setColor(color);
};


Program.prototype.onClickPenSize = function(event)
{
	var element = event.currentTarget;
    var size = $(element).data("size");
    this.pen.setSize(size);
};
Program.prototype.onClickColorPicker = function()
{
	$("#color-palette").fadeIn("slow");
};
Program.prototype.onPickColor = function()
{	$("#color-palette").fadeOut("slow");
	var color = this.colorPalette.pickedColor;
    this.pen.setColorAsRgb(color.red, color.green, color.blue);

};
Program.prototype.start = function() {
	$('#tool-color-picker').on('click', this.onClickColorPicker.bind(this));
	$("#tool-clear-canvas").on("click", this.canvas.clear.bind(this.canvas));
	$('.pen-color').on('click', this.onClickPenColor.bind(this));
	$(".pen-size").on("click", this.onClickPenSize.bind(this));
    $(document).on('magical-slate:pick-color', this.onPickColor.bind(this));
};