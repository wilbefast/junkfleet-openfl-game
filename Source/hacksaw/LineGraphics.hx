package hacksaw;

import flash.display.Graphics;
import flash.display.Shape;

class LineGraphics
{

	private function new() 
	{
	}
	
	private static inline var CIRCLE_SEGMENTS_PER_RADIUS = 3;
	
	public static inline function drawCircle(x : Float, y : Float, radius : Float, colour : Int = 0, lineWidth : Float = 1.0 ) : Shape
	{
		var result = new Shape();
		
		result.graphics.lineStyle(lineWidth, colour);
		
		result.graphics.moveTo(x + radius, y);
		var segments = cast(CIRCLE_SEGMENTS_PER_RADIUS * radius, Int);
		var angle_step = 2 * Math.PI / segments;
		for (i in 0 ... segments+1)
		{
			var angle = i * angle_step;
			var point_x = x + Math.cos(angle)*radius;
			var point_y = y + Math.sin(angle) * radius;
			result.graphics.lineTo(point_x, point_y);
		}
		
		return result;
	}
}