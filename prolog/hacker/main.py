# Без списков.
# Без вложенных структур (типов).

CONSTANT_NUMBER = 1
CONSTANT_SYMBOL = 2
CONSTANT_STRING = 3
VARIABLE_NAMED = 4
VARIABLE_UNNAMED = 5

def CheckTerm(term):
	if term[0].isdigit():
		return CONSTANT_NUMBER

	if term[0] == "'" or term[0] == '"':
		return CONSTANT_STRING

	if term[0] == '_':
		return VARIABLE_UNNAMED

	if term[0].islower():
		return CONSTANT_SYMBOL

	if term[0].isupper():
		return VARIABLE_NAMED
		
class Predicat():
	functor = str() # Имя.
	args = list()
	body = list() # Список предикатов?


	def __init__(self, functor, args, body):
		self.functor = functor
		self.args = args
		self.body = body


	def __init__(self, line):	
		self.functor = line[0:line.find("("):]
		self.args = line[line.find("(") + 1 : line.find(")")].split()
		
		for i in range(len(self.args)):
			self.args[i] = self.args[i].strip()
			self.args[i] = self.args[i].replace(",", "")

		self.body = -1

		index = line.find(":-")

		if index != -1:
			self.body = line[line.find(":-") + 2 : line.find(".") + 1]
			self.body = self.body.strip()


	def ApplySubstitution(self, substitution):
		for i in range(len(self.args)):
			value = substitution.get(self.args[i]) 
			if value:
				self.args[i] = value


	def Unification(self, term):
		if self.functor != term.functor:
			return False
		
		if len(self.args) != len(term.args):
			return False

		substitution = dict() 	# Подстановки
		bundles = dict()		# Связывание

		print("Унифицируем это")
		term.Print()
		print("С этим")
		self.Print()	
		print("Все")

		for i in range(len(self.args)):
			term_type = CheckTerm(term.args[i])
			self_type = CheckTerm(self.args[i])
			
			# print(self_type, term_type)
			# print(self.args[i], term.args[i])

			if self_type == CONSTANT_NUMBER and  \
				term_type == CONSTANT_NUMBER and \
			 	term.args[i] != self.args[i]:
				return False

			if self_type == CONSTANT_SYMBOL and \
				term_type == CONSTANT_SYMBOL and \
			 	term.args[i] != self.args[i]:
				return False
			
			if self_type  == CONSTANT_STRING and \
				term_type  == CONSTANT_STRING and\
			 	term.args[i] != self.args[i]:
				return False

			if self_type == VARIABLE_NAMED and \
				term_type != VARIABLE_NAMED: # and term_type != VARIABLE_UNNAMED: #TODO: '_'
				substitution[self.args[i]] = term.args[i]
				
			if term_type == VARIABLE_NAMED and \
				self_type != VARIABLE_NAMED:
				substitution[term.args[i]] = self.args[i]

			if 	self_type == term_type == VARIABLE_NAMED:
				bundles[term.args[i]] = self.args[i]
				
			# print(self_type, term_type)
			# print(self.args[i], term.args[i])
		return substitution, bundles # На самом деле return подстановка		


	def Print(self):
		print(self.functor, self.args, self.body, end = "\n\n", sep="\n")


def Main():
	f = open("lab_06.txt")
	goal = Predicat(f.readline())

	arr_result_terms = list()
	for elem in goal.args:
		if CheckTerm(elem) == VARIABLE_NAMED:
			arr_result_terms.append(elem)
	# print("arr_result_terms = ", arr_result_terms)

	goal.Print()

	# Первое состояние резольвенты - цель.
	resolvent = [goal]
	
	knowledge_base = list() # База знаний

	for line in f:
		if len(line) <= 1:
			continue
		info = Predicat(line) 
		knowledge_base.append(info)

	f.close() 

	for elem in knowledge_base:
		elem.Print() 

	substitution = dict()
	bundles = dict()

	while len(resolvent):
	# for i in range(2):
		for i in range(len(knowledge_base)):
			# Если унификация успешна
			info = knowledge_base[i]
			if not len(resolvent):
				break

			if info.Unification(resolvent[0]):
				# Заменяем на тело.
				substitution, bundles = info.Unification(resolvent[0])

				# for elem in newSubstitution:
				# 	substitution.append(elem)


				# for elem in newBundles:
				# 	bundles.append(elem)
				print(f"""Унификация:
		substitution = {substitution}
		bundles = {bundles} \n\n""")
		
				resolvent.pop(0) 

				if info.body != -1:
					for elem in info.body.split(" , "):
						p = Predicat(elem)
						resolvent.append(p)
						# p.Print()
				
				for j in range(len(resolvent)):
					resolvent[j].Print()

				for elem in resolvent:
					elem.ApplySubstitution(substitution)

				for j in range(len(resolvent)):
					resolvent[j].Print()

		# if len(resolvent): 
		# 	resolvent.pop(0) 
		


		



if __name__ == "__main__":
	Main()