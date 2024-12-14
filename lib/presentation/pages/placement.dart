import 'package:campusify/business_logic/cubits/SelectOptionCubit/select_option_cubit.dart';
import 'package:campusify/constants/colors.dart';
import 'package:campusify/constants/extensions.dart';
import 'package:campusify/constants/sizes.dart';
import 'package:campusify/data/models/placement.dart';
import 'package:campusify/presentation/widgets/navbar_child.dart';
import 'package:campusify/presentation/widgets/option.dart';
import 'package:campusify/presentation/widgets/placement_card.dart';
import 'package:campusify/presentation/widgets/textfields/form_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlacementPage extends StatefulWidget {
  const PlacementPage({super.key, required this.options});

  final List<String> options;

  @override
  State<PlacementPage> createState() => _PlacementPageState();
}

class _PlacementPageState extends State<PlacementPage> {
  final TextEditingController controller = TextEditingController();

  final List<Placement> placements = List.generate(
      4,
      (index) => Placement(
            title: 'System Administration',
            range: "15,000 - 20,000",
            experience: "0 - 2 Years",
            location: "Hyderabad",
            daysAgo: "16 d ago",
          ));

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(backgroundColor: AppColors.backgroundWhite, leading: NavbarChild(title: "Placements")),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FormTextfield(
                        controller: controller,
                        placeholder: "Search for jobs...",
                        style: context.body,
                        prefix: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            CupertinoIcons.search,
                            size: 24,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        CupertinoIcons.ellipsis_vertical,
                        size: 24,
                        color: AppColors.black,
                      ),
                    )
                  ],
                ),
                kGap12,
                BlocBuilder<SelectOptionCubit, SelectOptionState>(
                  builder: (context, state) {
                    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      for (int i = 0; i < widget.options.length; i++) ...[
                        OptionElement(
                            onTap: () {
                              selected = i;
                              BlocProvider.of<SelectOptionCubit>(context).onSelect();
                            },
                            selected: selected == i,
                            option: widget.options[i]),
                      ]
                    ]);
                  },
                ),
                kGap25,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "Internships (213)",
                        style: context.heading,
                      ),
                      const Spacer(),
                      Text(
                        "View all",
                        style: context.options.copyWith(color: AppColors.primaryOrange),
                      )
                    ],
                  ),
                ),
                kGap25,
                Expanded(
                  child: ListView.builder(
                      itemCount: placements.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: PlacementCard(placement: placements[index]),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
