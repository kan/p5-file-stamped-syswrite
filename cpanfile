requires 'perl', '5.008001';
requires 'File::Stamped', '0.03';
requires 'Path::Class', '0.33';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

