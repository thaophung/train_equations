from PIL import Image
from PIL import ImageDraw
import numpy as np
from PIL import ImageFont
# create image '+'

size = (28,28)
font = ImageFont.truetype('Chalkduster.ttf',24)
op = '+'
op_image = Image.new("RGB", size, (0,0,0))
draw_op = ImageDraw.Draw(op_image)
draw_op.text((6,0),op,(255,255,255), font=font)
op_name = 'addition_op.jpeg'
op_image.save(op_name)
