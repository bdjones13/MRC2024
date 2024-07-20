% PRIOR TO RUNNING THIS YOU MUST:
% 1. RUN load_javaplex.m
% 2. RUN 'addpath(genpath(pwd))' (while in the Dowker folder) in the command line
clear all;

A = cycleNetwork(7,1);

% we can compute rips persistence even with asym dists
[sk0,sk1,sk2,~] = rips(A);
computePers(sk0,sk1,sk2,[]);

% here we compute with dowker filt
[sk0,sk1,sk2,~] = dowker(A);
[x y] = computePers(sk0,sk1,sk2,[]);

% get the dowker gens and save em to 'demo_file'
c = edu.stanford.math.plex4.homology.barcodes.AnnotatedBarcodeCollection.getGeneratorIterator(y);

c.next(); % dim 0 isnt interesting
dim1 = c.next();
s = dim1.toString;
spl = split(s, ', ');

mygens = makeGenerators(spl);
    
fid = fopen('demo_file','w');
fprintf(fid, '%s', jsonencode(mygens));
fclose(fid);



