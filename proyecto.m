addpath('/home/camilo/Documentos/Upn/2015/IA/proyecto/imágenes/profile_images1');

ancho_imagen=20;
alto_imagen=20;
total_pixeles=ancho_imagen*alto_imagen;

archivo_weka = fopen('/home/camilo/Documentos/Upn/2015/IA/proyecto/dataset_imgs.arff','w');
fprintf(archivo_weka,'@relation rostros\n');
for i=1:total_pixeles
   nombre_atributo=['p' int2str(i)]; 
   fprintf(archivo_weka,'@attribute  %s numeric\n',nombre_atributo);
   
end

fprintf(archivo_weka,'@attribute ''class'' { clase1, clase2, clase3 }\n');

fprintf(archivo_weka,'@data\n');
for i=1:3
    file = ['a' int2str(i) '.pgm' ];    
    im = imread(file);
    sub_im = im(1:alto_imagen,1:ancho_imagen);
    
    if i>=1 && i<=2
        clase='clase1';      
    end    
    
    if i>=3 && i<=4
        clase='clase2';      
    end    
    
    s=sprintf('%d,',sub_im);
    fprintf(archivo_weka,'%s,%s\n',s,clase);
    
    
    
end

fclose(archivo_weka);