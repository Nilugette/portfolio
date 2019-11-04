var Slate = function(pen) {
	this.canvas = document.getElementById('slate');
    this.context = this.canvas.getContext('2d');
    this.isDrawing = false; // on est pas encore entrain de dessiner
    this.currentLocation = null; // par défaut elle est nulle
	this.pen = pen;
	this.canvas.addEventListener('mousedown', this.onMouseDown.bind(this));
	this.canvas.addEventListener('mouseleave', this.onMouseUp.bind(this));
	this.canvas.addEventListener('mouseup', this.onMouseUp.bind(this));
	this.canvas.addEventListener('mousemove', this.onMouseMove.bind(this));
	
	
};
Slate.prototype.clear = function()
{
    this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
};
// { x: x, y: y }   getBoundingClientRect()
Slate.prototype.getMouseLocation = function(evt) {
	var bounds = this.canvas.getBoundingClientRect();
	 return {
      x: evt.clientX - bounds.left,
      y: evt.clientY - bounds.top
   };
};

Slate.prototype.onMouseDown = function(event) {
	this.isDrawing = true; 
	this.currentLocation = this.getMouseLocation(event);

};

Slate.prototype.onMouseMove = function(event) {

	var location;
    location = this.getMouseLocation(event);
	
    if (this.isDrawing) {
      
      this.context.strokeStyle = this.pen.color;
	  this.context.lineWidth = this.pen.size;
      this.context.beginPath();
      this.context.moveTo(this.currentLocation.x, this.currentLocation.y);
      this.context.lineTo(location.x, location.y); 
      this.context.closePath();
      this.context.stroke();
      
    }
	this.currentLocation = location;
    
};




Slate.prototype.onMouseUp = function(event) {

	this.isDrawing = false;
    
};


