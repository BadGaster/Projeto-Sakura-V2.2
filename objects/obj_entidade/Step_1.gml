//olhando pro lado certo
if(velocidade_horizontal != 0) xscale = sign(velocidade_horizontal)
image_xscale = xscale

//estado de usuario

if (position_meeting(mouse_x, mouse_y, id))
{
if (mouse_check_button_released(mb_left))
mostra_estado = !mostra_estado
}


image_speed = (velocidade_de_imagem / image_speed)