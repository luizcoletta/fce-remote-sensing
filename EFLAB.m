function [labfeat] = EFLAB(img)

          labsub = EFRGB2LAB(img);   
          L = labsub(:,:,1);
          A = labsub(:,:,2); % red > 0; green < 0;
          B = labsub(:,:,3); % yellow > 0; blue < 0;
          nrows = size(A,1);
          ncols = size(A,2);
          L = reshape(L,1,nrows*ncols);
          A = reshape(A,1,nrows*ncols);
          B = reshape(B,1,nrows*ncols);
          % Removing zeros to avoid mean's distortions
          X = L(find(L~=0));
          Y = A(find(A~=0));
          Z = B(find(B~=0));
          avgX = mean(X);
          avgY = mean(Y);
          avgZ = mean(Z);
          %labfeat = [avgX, avgY, avgZ];
          labfeat = [avgX];
end
