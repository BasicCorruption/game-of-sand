package;

import Materials;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var sandbox:FlxSprite;
	var mtsl:Materials = WALL;
	var cursor:FlxSprite;

	override public function create()
	{
		super.create();

		sandbox = new FlxSprite();
		sandbox.makeGraphic(1280, 720, FlxColor.WHITE);
		sandbox.screenCenter(X);
		add(sandbox);

		cursor = new FlxSprite();
		cursor.makeGraphic(4, 4, FlxColor.RED);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(sandbox))
		{
			if (FlxG.mouse.pressed)
			{
				var d = dot(FlxColor.BLACK, FlxG.mouse.x, FlxG.mouse.y);
				add(d);
			}
		}
	}

	public static function dot(dcolor:FlxColor, xp:Int, yp:Int)
	{
		var x = new FlxSprite();
		x.makeGraphic(16, 16, dcolor);
		x.x = xp;
		x.y = yp;
		return x;
	}
}
