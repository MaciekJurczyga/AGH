function x_all = zad2_9_function(audio, fs, delays, amplitudes)
    
 
    fpr = 8000;
    audio_resampled = resample(audio, fpr, fs);
    
    % Liczba próbek w oryginalnym sygnale
    len_audio = length(audio_resampled);
    
    % Inicjalizacja macierzy na wszystkie odbicia
    x_all = zeros(len_audio + max(delays), length(delays));
    
    for i = 1:length(delays)
        delay_samples = delays(i);
        amplitude = amplitudes(i);
        
        % Generowanie sygnału z odpowiednim opóźnieniem i amplitudą
        reflected_signal = [zeros(delay_samples, 1); audio_resampled] * amplitude;
        
        % Dodanie do macierzy wszystkich odbić
        x_all(1:len_audio + delay_samples, i) = reflected_signal;
    end
    
    % Sumowanie wszystkich odbić, 2 oznacza, że sumujemy wiersze
    x_all = sum(x_all, 2);
end

