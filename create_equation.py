from PIL import Image
from PIL import ImageDraw
import os

#training_path = './mnist_training_10_images_per_number/'
testing_path = './mnist_testing_4_images_per_number/'
#new_path = './training_equations_10_images_per_number/'
new_path = './testing_equations_4_images_per_number/'
if not os.path.exists(new_path):
    os.makedirs(new_path)


num_image = 1

for j in range(0,10):
    #first_path = training_path + str(j) + '/'
    first_path = testing_path + str(j) + '/'
    for first_num in os.listdir(first_path):
        for i in range(0,10):
            second_path = testing_path + str(i) + '/'
            #second_path = training_path + str(i) + '/'
            equation_folder = new_path+ str(j) + '+' + str(i)
            if not os.path.exists(equation_folder):
                os.makedirs(equation_folder)
            for second_num in os.listdir(second_path):
                size = (84,28)
                canvas = Image.new("RGB", size, (0,0,0))
                image_name = str(num_image)
                first_number_added = Image.open(first_path+first_num)
                canvas.paste(first_number_added, (0,0))
                op_image = Image.open('./add_image.jpeg')
                canvas.paste(op_image,(28,0))
                second_number_added = Image.open(second_path+second_num)
                canvas.paste(second_number_added,(56,0))
                canvas.save(equation_folder+'/'+image_name+'.jpeg')
                num_image += 1
            




