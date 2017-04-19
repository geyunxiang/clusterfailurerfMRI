function max_cluster = max_extent(image, indices)
% function result = extentThreshold(image, indices)

[x, y, z] = ind2sub(size(image), indices);
% The x and y are row and column numbers identified by the linear indices
% They are also called subscripts.
% That is, indices(1) represents image(x, y) or something like that.

XYZ = [x y z];

% from spm_getSPM line 676:

%-Calculate extent threshold filtering (from spm_getSPM, line 676)
%-------------------------------------------------------------------
% spm_clusters returns the cluster index for a point list
% spm_clusters(L, n), where L is the locations and n is the connectivity criterion.
% L is expected to be [x y x]', a (3 x m) matrix
% The returned A contains cluster index or region number. It is a (1 x m) vector.
% default n = 18

%  spm_clusters characterises a point list of voxel values defined with
%  their locations (L) in terms of edge, face and vertex connected
%  subsets, returning a list of indices in A, such that the ith location
%  belongs to cluster A(i) (using an 18 connectivity scheme).

A     = spm_clusters(XYZ');
max_cluster = 0;
for i = 1:max(A)
    j = find(A == i);
    if (length(j) > max_cluster)
        max_cluster = length(j);
    end
end
