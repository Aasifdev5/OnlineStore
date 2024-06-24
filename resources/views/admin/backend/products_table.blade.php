<div class="table-responsive">
    <table id="advance-1" class="table table-bordered table-striped table-theme" style="width:100%;">
        <thead>
            <tr>
                <th class="text-center" style="width:3%">#</th>
                <th class="text-left" style="width:21%">{{ __('Product Name') }}</th>
                <th class="text-left" style="width:15%">{{ __('Category') }}</th>
                {{-- <th class="text-left" style="width:15%">{{ __('Brand') }}</th> --}}
                <th class="text-center" style="width:10%">{{ __('Store') }}</th>

                <th class="text-center" style="width:8%">{{ __('Image') }} </th>
                <th class="text-center" style="width:8%">{{ __('Status') }}</th>
                <th class="text-center" style="width:8%">{{ __('Action') }}</th>
            </tr>
        </thead>
        <tbody>

            @foreach ($datalist as $row)
                @php
                    if (!empty($row->brand_id)) {
                        $brandName = \App\Models\Brand::where('id', $row->brand_id)->first()->name;
                    }
                    if (!empty($storeName)) {
                        $storeName = \App\Models\User::where('id', $row->store_id)->first()->store;
                    }

                @endphp
                <tr>

                    <td class="text-center">{{ $loop->iteration }}</td>
                    <td class="text-left"><a href="{{ route('backend.product', [$row->id]) }}"
                            title="{{ __('Edit') }}">{{ $row->title }}</a></td>
                    <td class="text-left">{{ $row->cat_id }}</td>


                    <td class="text-center">
                        @if (!empty($storeName))
                            {{ $storeName }}
                        @endif
                    </td>

                    @if ($row->f_thumbnail != '')
                        <td class="text-center">
                            <div class="table_col_image"><img
                                    src="{{ asset('') }}f_thumbnail/{{ $row->f_thumbnail }}" width="100"
                                    height="60" /></div>
                        </td>
                    @else
                        <td class="text-center">
                            <div class="table_col_image"><img
                                    src="{{ asset('') }}/backend/images/album_icon.png" /></div>
                        </td>
                    @endif

                    @if ($row->is_publish == 1)
                        <td class="text-center"><span class="enable_btn">{{ $row->status }}</span></td>
                    @else
                        <td class="text-center"><span class="disable_btn">{{ $row->status }}</span></td>
                    @endif
                    <td class="text-center">
                        <a href="#" class="btn btn-icon waves-effect waves-light btn-danger m-b-5 delete-link"
                            data-id="{{ $row->id }}" data-toggle="tooltip" title="{{ trans('remove') }}">
                            <i class="fa fa-remove"></i>
                        </a>

                        <form id="delete-form-{{ $row->id }}"
                            action="{{ route('permissions.delete', $row->id) }}" method="POST" style="display: none;">
                            @csrf
                            @method('DELETE')
                        </form>
                    </td>
                </tr>
            @endforeach

        </tbody>
    </table>
</div>
