function graph_pers(input_graph_filename, output_json_filename)

    import edu.stanford.math.plex4.*;
    
    % PRIOR TO RUNNING THIS YOU MUST:
    % 1. RUN load_javaplex.m
    % 2. RUN 'addpath(genpath(pwd))' (while in the Dowker~ folder) in the command line
    % NB: change computePers function signature:
    %   function [intervals,represent]=computePers(sk0,sk1,sk2,sk3,diam,filename,resfolder)
    % data = csvread("distancematrix.csv");
    A = csvread(input_graph_filename);
    % A = reshape(data,[101,101]);
    A(A == -1) = 50;
    % tic
    [sk0,sk1,sk2,~] = dowker(A);
    % toc
    % tic
    [x y] = computePers(sk0,sk1,sk2,[]);
    % toc
    % Inputs are intervals, dim and bool flag for inf intervals.
    %intervals_dim0 = edu.stanford.math.plex4.homology.barcodes.BarcodeUtility...
    %.getEndpoints(x, 0, 0);
    
    %intervals_dim1 = edu.stanford.math.plex4.homology.barcodes.BarcodeUtility...
    %.getEndpoints(x, 1, 0);
    
    c = edu.stanford.math.plex4.homology.barcodes.AnnotatedBarcodeCollection.getGeneratorIterator(y);
    
    dim0 = c.next();
    dim1 = c.next();
    
    s = dim1.toString;
    % disp("splits....")
    spl = split(s, ', ');
    % disp("end splits")
    
    mygens = makeGenerators(spl);
    
    fid = fopen(output_json_filename,'w');
    fprintf(fid, '%s', jsonencode(mygens));
    fclose(fid);
end
