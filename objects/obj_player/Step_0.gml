//variaveis
var right, left, jump, attack
var chao = place_meeting(x, y + 1, obj_wall)

right = keyboard_check(ord("D"))
left = keyboard_check(ord("A"))
jump = keyboard_check_pressed(ord("W"))

//codigo de movimentação

velocidade_horizontal = (right - left) * velocidade_horizontal_max



//gravidade

if (!chao)
{
	if(velocidade_vertical < velocidade_vertical_max * 2)
	{
	velocidade_vertical += GRAVIDADE * massa
	}
}

else//pulando

{
	if(jump)
	{
	velocidade_vertical = -velocidade_vertical_max
	}
}


//maquina de estado

switch(estado)
{
	case "parado":
	{
		//comportamento de estado
		sprite_index = spr_player_idle
		
		//troca de estado
		//movendo
		if(right || left)
		{
			estado = "movendo"
		}
		break
	}
	case "movendo":
	//andando
	sprite_index = spr_player_walk
	
	//voltando a ficar parado
	
	if (abs(velocidade_horizontal) < .1)
	{
	estado = "parado"
	velocidade_horizontal = 0
	}
	
	break
	
}








