%data='ob';
%data_title='Outbrain';
data='kkbox';
data_title='KKBOX'
%data='kdd12';
%data_title='KDD-2012'

names={'k', 'l', 'w', 't'};
symbols={'$k$', '$\lambda$', '$\omega$', '$T$'};
xlabels={'latent dimension $k$', 'regularization coefficient $\lambda$', 'negatives cost weight $\omega$', 'stopping iteration $T$'};

% k, l, w log2(x)
for i = [1:3]
    %figure;
    logs = csvread(strcat(data,'/',names{i},'.csv'));
    xdata = logs(:, 1);
    ydata = logs(:, 2);
    plot(log2(xdata), ydata, '-*', 'LineWidth', 2,'MarkerSize', 2);
    
    % ticks
    ylim([min(ydata)*0.5 max(ydata)*1.15]);
    ticks=log2(xdata);
    ticksLabels={};
    for k = 1:size(xdata)
        ticksLabels{k} = sprintf('2^{%d}', log2(xdata(k, 1)));
    end
    xticks(ticks);
    xticklabels(ticksLabels);

    % lables
    xlabel({xlabels{i}}, 'Interpreter', 'latex');
    ylabel('P@5');
    
    title(data_title);
    saveas(gcf, sprintf('%s-%s.png', data, names{i}));
end

% T
for i = 4
    figure;
    logs = csvread(strcat(data,'/',names{i},'.csv'));
    xdata = logs(:, 1);
    ydata = logs(:, 2);
    plot(xdata, ydata, '-*', 'LineWidth', 2,'MarkerSize', 2);
    

    % ticks
    ylim([min(ydata)*0.5 max(ydata)*1.15]);
    ticks=xdata;
    ticksLabels={};
    for k = 1:size(xdata)
        if mod(k,2) == 0
            ticksLabels{k} = sprintf('%d', xdata(k, 1));
        else
            ticksLabels{k} = '';
        end
    end
        ticksLabels
    xticks(ticks);
    xticklabels(ticksLabels);

    % labels
    xlabel({xlabels{i}}, 'Interpreter', 'latex');
    ylabel('P@5');
    
    title(data_title);
    saveas(gcf, sprintf('%s-%s.png', data, names{i}));
end
