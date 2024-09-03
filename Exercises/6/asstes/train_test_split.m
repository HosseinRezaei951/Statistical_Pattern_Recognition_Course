function [train_x, train_y, test_x, test_y] = train_test_split(data, labels, split_rathio)
    cv = cvpartition(size(data,1),'HoldOut',1-split_rathio);
    idx = cv.test;
    train_x = data(~idx,:);
    train_y = labels(~idx,:);

    test_x  = data(idx,:);
    test_y = labels(idx,:);
end