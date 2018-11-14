dirinfo = dir('/opt/lintula/worktmp/audio_research/create-speaker-mixtures/wsj0');

for subd = 3:length(dirinfo)
    
    subdirinfo = dir(['/opt/lintula/worktmp/audio_research/create-speaker-mixtures/wsj0/'  dirinfo(subd).name]);
    for subsubd = 3 : length(subdirinfo)
        thisdir = ['/opt/lintula/worktmp/audio_research/create-speaker-mixtures/wsj0/' dirinfo(subd).name '/' subdirinfo(subsubd).name];
        wvfiles = dir(fullfile(thisdir, '*.wv1'));
        for fileid =  1:length(wvfiles)
            system(['/worktmp/sph2pipe/sph2pipe' ...
                ' -f raw ' [thisdir '/' wvfiles(fileid).name] ...
                ' -f wav ' [thisdir '/' wvfiles(fileid).name(1:end-4) '.wav']]); % to convert vw1 to wav
%             [thisdir wvfiles(fileid).name]
%             [thisdir wvfiles(fileid).name(1:end-4) '.wav']
        end
        
    end

end

