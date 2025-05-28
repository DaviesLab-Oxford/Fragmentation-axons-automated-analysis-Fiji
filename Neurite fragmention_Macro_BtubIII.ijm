
dir = getDirectory("select input dir");
list = getFileList(dir);
dir2 = getDirectory("select output dir");

for(a=0; a<list.length; a++) {
open(dir+list[a]);
wait(200);
imageTitle=getTitle();
selectWindow(imageTitle);
setAutoThreshold("Default dark");
//run("Threshold...");
setThreshold(50, 255); 'Adjusting threshold according to your own data'
selectWindow(imageTitle);
run("Create Selection");
roiManager("Add");
roiManager("Select", 0);
roiManager("Rename", "BtubIII");
roiManager("Measure"); 'Measuring total area of BtubIII+ axons'
roiManager("Deselect");
roiManager("Delete");
selectWindow(imageTitle);
setOption("BlackBackground", false);
run("Convert to Mask");
run("Analyze Particles...", "size=0.5-75 circularity=0-1.00 show=Outlines summarize"); 'Measuring total area of BtubIII+ particles'
selectWindow(imageTitle);
close();
selectWindow("Drawing of "+imageTitle);
imageTitle=getTitle(); saveAs("Tiff", dir2+imageTitle); 
close();
}
