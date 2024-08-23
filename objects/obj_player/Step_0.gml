//variaveis
var right, left, jump, attack
var chao = place_meeting(x, y + 1, obj_wall)

right = keyboard_check(ord("D"))
left = keyboard_check(ord("A"))
jump = keyboard_check_pressed(ord("W"))
attack = keyboard_check_pressed(ord("O"))

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
			image_index = 0
		}
		else if (jump || velocidade_vertical != 0)
		{
			estado = "pulando"
			velocidade_vertical = (-velocidade_vertical_max * jump)
			image_index = 0
		}
		else if (attack)
		{
			estado = "ataque"
			velocidade_horizontal = 0
			image_index = 0
		}
		break
	}
	case "movendo":
	{
	//andando
	sprite_index = spr_player_walk
	
	//voltando a ficar parado
	
	if (abs(velocidade_horizontal) < .1)
	{
		estado = "parado"
		velocidade_horizontal = 0
	}
	else if (jump)
	{
		estado = "pulando"
		velocidade_vertical = -velocidade_vertical_max
		image_index = 0
	}
	else if(attack)
	{
		estado = "ataque"
		velocidade_horizontal = 0
		image_index = 0
	}
		
	
	break
	
}
case "pulando":
	{
	//caindo
	if (velocidade_vertical > 0)
		{
		sprite_index = spr_player_fall
		}
	else
		{
		sprite_index = spr_player_jump
		}
		
	//evitando repetição
	if(image_index >= image_number-1)
	{
		image_index = image_number-1
	}

//troca de estado

	if(chao)
	{
		estado = "parado"
		velocidade_vertical = 0
	}
	break
	}
	
	case "ataque":
	{
	velocidade_horizontal = 0
	if(combo == 0)
	{
		sprite_index = spr_player_attack_1
	}
	else if(combo == 1)
	{
		sprite_index = spr_player_attack_2	
	}
	else if(combo == 2)
	{
		sprite_index = spr_player_attack_3	
	}
	
	if(attack && combo < 2 && image_index >= image_number -2)
	{
		combo++
		image_index = 0
	}
	
	if(image_index > image_number-1)
	
	{
	estado = "parado"
	velocidade_horizontal = 0
	combo = 0
	}
	
	break
	}
}