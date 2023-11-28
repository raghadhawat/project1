import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit() : super(MedicineInitial());
}
