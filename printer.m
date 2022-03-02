clear all
%gets all jpeg file names
folderContents=dir('*.jpg');
%converts the struct containing the filenames to a table
folderContents=struct2table(folderContents);

%this loop saves each jpg in folder as a txt file for printer
for x=1:height(folderContents)
    %reads the image (curly braces are like a pointer since I need to access the string in the table)
    image=imread(folderContents{x,1});
    %turns image to grayscale now it is a table of the size of the image in pixels
    image = rgb2gray(image);
    %just replacing .jpg with a .txt in the filename
    filename=strrep(folderContents{x,1},'.jpg','.txt');
    %sorts the image into black and white pixels (0-127 = black, 128-255 = white)
    image(:,:) = image>127;
    
%I feel like the image should still be downsampled to a maximum size format which we can agree upon later
    
    %writing the text file
    writematrix(image,filename,'Delimiter',' ')
end
device = serialport("COM3",9600);
write(device,image,"uint8")




%this part is to show the image that will be printed
image=image*255;
imshow(image)

% go to this: MATLAB Support Package for Arduino Hardware — Examples
%a = arduino