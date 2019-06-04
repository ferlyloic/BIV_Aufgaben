%% Gruppe N :
% 1527985   Donkeng, Ferly Loic    IMB
% 
% 1611148   Warsame, Ahmed    IB


%% BIV-Übung 3

%% 1 Histogramme und globaler Kontrast
% a) Laden Sie das Bild blueten.jpg mit imread. Um später keine Unterschiede zwischen Bildern mit Datentyp uint8 (Wertebereich [0,255]) (wie das gerade geladene Bild) und double Bildern machen zu müssen, ist es sinnvoll, das Bild gleich in double zu konvertieren: doubleBild=double(uint8Bild). Den Wertebereich jetzt noch auf [0,1] anpassen.
% Lassen Sie sich das Bild noch nicht anzeigen!
blueten_int = imread('blueten.jpg');
blueten_double = double(blueten_int)/255.0;
%%
% b) Berechnen Sie die Histogramme der Farbkanäle R, G, B und lassen Sie sie alle gleichzeitig in Form von überlagerten Kurven anzeigen. Anleitung:
%
% * Zunächst ein Fenster mit dem Befehl figure öffnen.
% * Histogramme von Bildern mit einem Kanal (!) können mit imhist berechnet werden. Die Funktion gibt ein Array mit den Histogramm-Werten zurück. Wenn Sie den Rückgabewert nicht verwenden, wird das Histogramm direkt angezeigt. Für die nächste Teilaufgabe brauchen Sie jedoch das zurückgegebene Array!
% * Kurven (bestehend aus miteinander verbundenen Punkten eines Arrays) lassen sich mit plot(array, 'farbe') anzeigen; zum Beispiel für rot 'farbe' auf 'r' setzen.
% * Um Kurven zu überlagern, müssen Sie hold on nach dem ersten plot-Befehl aufrufen.
% * Sie können Plot-Fenstern eine Überschrift geben mit z.B. title('Histogramm');

hist_blueten_r = imhist(blueten_double(:,:,1));
hist_blueten_g = imhist(blueten_double(:,:,2));
hist_blueten_b = imhist(blueten_double(:,:,3));
x = linspace(0,1,256);
figure
plot(x, hist_blueten_r, 'r');
hold on;
plot(x, hist_blueten_g, 'g');
plot(x, hist_blueten_b, 'b');
legend('r = Rot', 'g = Grün', 'b = Blau',  'Location', 'north')
title('Histogramm 1')


%%
% c) Überlagern Sie zusätzlich das Histogramm der Intensitäten (Helligkeiten). Nützlich zur Berechnung der Intensitäten ist eine Funktion von dem vorigen Aufgabenblatt.

grauwert = rgb2gray(blueten_double);
grauwert_hist = imhist(grauwert);
% Show histogram of image 
figure

plot(x, hist_blueten_r, 'r');
hold on;
plot(x, hist_blueten_g, 'g');
plot(x, hist_blueten_b, 'b');
plot(x, grauwert_hist,'k'); 
legend('r = Rot', 'g = Grün', 'b = Blau', 'k = Grauwerte',  'Location', 'north')
title('Histogramm 2')

%%
% Wird das Bild (ohne es bisher angezeigt zu haben) wohl eher zu dunkel oder zu hell dargestellt werden?
disp('eher zu dunkel.')
%%
% Übernehmen Sie das Histogramm und Ihre Vermutung in das Protokoll.
% Lassen Sie sich das Bild mit imshow anzeigen. Hatten Sie mit Ihrer Vermutung recht?
figure
imshow(blueten_double)
%%
% Optional: Lassen Sie sich mit showQuadView wie bei dem vorigen Aufgabenblatt die RGBund
% HSI-Kanäle kombiniert und einzeln anzeigen.
showQuadView(blueten_double,blueten_double(:,:,1),blueten_double(:,:,2),blueten_double(:,:,3));
blueten_double_hsi = rgb2hsi(blueten_double);
showQuadView(blueten_double_hsi,blueten_double_hsi(:,:,1),blueten_double_hsi(:,:,2),blueten_double_hsi(:,:,3))
%%
% d) Berechnen Sie das Minimum, das Maximum und den globalen Kontrast der Bildhelligkeit (Intensität) mit Hilfe der Funktionen min und max.
% Beachten Sie dabei: In MATLAB arbeiten viele Berechnungsfunktionen (darunter min, max) entlang jeder Spalte. Sie bekommen also das Minimum/Maximum je Spalte. Mit array(:) wird aus jedem array (egal welcher Dimension) ein eindimensionales Array mit nur einer Spalte.
% Übernehmen Sie den Kontrastwert in das Protokoll.
min_grauw = min(grauwert(:));
disp(['min = ', num2str(min_grauw),'.']);
max_grauw = max(grauwert(:));
disp(['max = ', num2str(max_grauw),'.']);
%%
% e) Berechnen Sie nun einen stabilen, rauschunempfindlichen Wert für den globalen Kontrast mit der Funktion stretchlim. In der Dokumentation (doc stretchlim)finden Sie Details dazu.
% Übernehmen Sie auch diesen, stabilen Kontrastwert in das Protokoll.
stabil_w = stretchlim(grauwert);
output = ['[' num2str(stabil_w(1)) ', ' num2str(stabil_w(2)) ']'];
disp(output);
%%
% f) Der stabile Wert für den Kontrast unterscheidet sich recht deutlich von dem mit Hilfe der Funktionen min und max berechneten Kontrast. Um dies nachzuvollziehen, lassen Sie sich die Zahlenwerte des Histogramms der Intensitäten aus Teilaufgabe c ausgeben. Ist dies auch an dem geplotteten Histogramm erkennbar?
