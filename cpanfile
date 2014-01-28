requires 'perl', '5.008001';
requires 'File::Stamped', '0.03';
requires 'Path::Class';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

