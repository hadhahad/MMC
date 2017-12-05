function [pocOut, stavPrepazekOut] = utOdbaveni(stavPrepazekIn, pocVCekarne, casKrok)
% nulta iterace - v kazdem kroku odbavime 1 cloveka na prepazku

stavPrepazekOut = stavPrepazekIn;
pocOut = length(stavPrepazekIn);
if pocOut > pocVCekarne
    pocOut = pocVCekarne;
end


end