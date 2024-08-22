//sistema de colisão e movimento
var _velocidade_horizontal = sign(velocidade_horizontal)
var _velocidade_vertical = sign(velocidade_vertical)

//horizontal

repeat(abs(velocidade_horizontal))
{
if (place_meeting(x + _velocidade_horizontal, y, obj_wall))
	{
	velocidade_horizontal = 0
	break
	}
x += _velocidade_horizontal
}

repeat(abs(velocidade_vertical))
{
if (place_meeting(x, y + _velocidade_vertical, obj_wall))
	{
	velocidade_vertical = 0
	break
	}
y += _velocidade_vertical
}