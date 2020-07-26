% Wiener.m, Матвеева, Р3470, MatLab
% Очистка зашумлённого изображения 
% Методом адаптивной фильтрации Винера,
% Дьяконов и Абраменкова: imnoise - с. 548, wiener2 - с. 553
clc, clear % Очистка command window и workspace
%RGB = imread ('saturn.png'); % 1500 x 1200 x 3 uint8
% RGB = imread ('football.jpg'); % 256 x 320 x 3
RGB = imread ('cameraman.tif'); 


%I = rgb2gray(RGB); % Преобразование RGB в серый
figure('Position', [10 50 1450 900]); % Открытие новой графической страницы во весь экран
%subplot(2, 2, 1);  % Вывод на экран в 1ое графическое подокно RGB-изображения
%imshow(RGB); title('RGB', 'FontName', 'Times New Roman', 'FontSize', 14);
%subplot(2, 2, 2);
%imshow(I); title('I', 'FontName', 'Tahoma', 'FontSize', 14);

% Наложение гауссова шума:
J = imnoise(RGB, 'gaussian', 0/256, (30/256)^2); % Добавление гауссова шума
subplot(2, 2, 3);
imshow(J); title('J', 'FontName', 'Tahoma', 'FontSize', 14);

% Устранение шума методом адаптивной фильтрации Винера
K = wiener2c (J, [4 4]);
subplot(2, 2, 4);
imshow(K); title('K', 'FontName', 'Tahoma', 'FontSize', 14);
